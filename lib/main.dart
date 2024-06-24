import 'package:Pomodoro/widgets/round-button.dart';
import 'package:flutter/material.dart';
import 'package:Pomodoro/config-menu.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PomodoroPage(),
    );
  }
}

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  _PomodoroPageState createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  final GlobalKey<_PomoTimerState> _pomoTimerKey = GlobalKey<_PomoTimerState>();
  final ValueNotifier<bool> isCountingNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: ValueListenableBuilder<bool>(
          valueListenable: isCountingNotifier,
          builder: (context, isCounting, child) {
            return MenuButton(
              isActive: !isCounting,
              onValueSelected: (value) {
                _pomoTimerKey.currentState?.setFocusTime(value);
              },
            );
          },
        ),
        title: const Text(
          'Pomodoro',
          style: TextStyle(color: Colors.black, fontFamily: 'Titi'),
        ),
      ),
      body: PomoTimer(key: _pomoTimerKey, isCountingNotifier: isCountingNotifier),
    );
  }
}

class PomoTimer extends StatefulWidget {
  final ValueNotifier<bool> isCountingNotifier;

  const PomoTimer({Key? key, required this.isCountingNotifier}) : super(key: key);

  @override
  _PomoTimerState createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimer> with TickerProviderStateMixin {
  late AnimationController controller;
  final player = AudioPlayer();
  bool isCounting = false;
  bool isFocusing = true; // Variável para alternar entre foco e descanso
  bool isReturnConfigPage = false;
  double progress = 1.0;
  int cycle = 1;
  int skip = 0;
  int focusTimerH = 0;
  int focusTimerM = 0;
  int focusTimerS = 2;
  int shortBreakTimerH = 0;
  int shortBreakTimerM = 0;
  int shortBreakTimerS = 3;
  int longBreakTimerH = 0;
  int longBreakTimerM = 10;
  int longBreakTimerS = 0;
  int numberCycles = 4;

  String get countText {
    Duration count = controller.duration! * controller.value;
    if (controller.value == 0) {
      count = isFocusing
          ? Duration(hours: focusTimerH, minutes: focusTimerM, seconds: focusTimerS)
          : Duration(hours: shortBreakTimerH, minutes: shortBreakTimerM, seconds: shortBreakTimerS);
    }
    return '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void notify() {
    if (controller.value == 0) {
      if(skip == 0){
        player.play(AssetSource('notify.mp3'));
        if(isFocusing == false){
          cycle++;
        }
        if(cycle > numberCycles) {
          cycle = 1;
          controller.stop();
          isCounting = false;
          widget.isCountingNotifier.value = isCounting;
        }
      }
      skip = 0;
      // Alternar entre foco e descanso
      setState(() {
        if(!isReturnConfigPage){
          isFocusing = !isFocusing;
        }
        controller.duration = isFocusing
            ? Duration(hours: focusTimerH, minutes: focusTimerM, seconds: focusTimerS)
            : Duration(hours: shortBreakTimerH, minutes: shortBreakTimerM, seconds: shortBreakTimerS);
        if (isCounting) {
          controller.reverse(from: 1.0);
        }
      });
    }
  }

  void setFocusTime(FocusTime focusTime) {
    setState(() {
      isReturnConfigPage = true;
      skip++;
      focusTimerH = focusTime.returnFocusHours;
      focusTimerM = focusTime.returnFocusMinutes;
      focusTimerS = focusTime.returnFocusSeconds;
      shortBreakTimerH = focusTime.returnBreakHours;
      shortBreakTimerM = focusTime.returnBreakMinutes;
      shortBreakTimerS = focusTime.returnBreakSeconds;
      longBreakTimerH = focusTime.returnLongBreakHours;
      longBreakTimerM = focusTime.returnLongBreakMinutes;
      longBreakTimerS = focusTime.returnLongBreakSeconds;
      numberCycles = focusTime.returnNumberCycles;

      controller.duration = isFocusing
          ? Duration(hours: focusTimerH, minutes: focusTimerM, seconds: focusTimerS)
          : Duration(hours: shortBreakTimerH, minutes: shortBreakTimerM, seconds: shortBreakTimerS);

      // Resetar o controlador e o progresso
      controller.reset();
      progress = 1.0;
      isCounting = false;
      widget.isCountingNotifier.value = isCounting;
    });
    isReturnConfigPage = false;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: focusTimerH, minutes: focusTimerM, seconds: focusTimerS),
    );
    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void resetTimer() {
    if (!controller.isAnimating) {
      setState(() {
        skip++;
        controller.reset();
        progress = 1.0;
        isCounting = false;
        widget.isCountingNotifier.value = isCounting;
        // Atualiza a duração do controlador sem iniciar o contador
        controller.duration = isFocusing
            ? Duration(hours: focusTimerH, minutes: focusTimerM, seconds: focusTimerS)
            : Duration(hours: shortBreakTimerH, minutes: shortBreakTimerM, seconds: shortBreakTimerS);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pause o timer para pular etapas'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fbff),
      body: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            height: 100,
            child: Text(
              isFocusing == false ? 'Hora do descanso' : 'Hora do foco',
              style: TextStyle(
                fontFamily: 'Titi',
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.grey.shade300,
                      value: progress,
                      strokeWidth: 3,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: const TextStyle(
                        fontSize: 60,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topCenter,
            height: 70,
            child: Text(
              'Ciclo atual: $cycle / $numberCycles',
              style: TextStyle(
                fontFamily: 'Titi',
                fontSize: 15
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                RoundButton(
                  text: isCounting == true ? 'Pausar' : 'Iniciar',
                  onPressed: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isCounting = false;
                        widget.isCountingNotifier.value = isCounting;
                      });
                    } else {
                      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isCounting = true;
                        widget.isCountingNotifier.value = isCounting;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                RoundButton(
                  text: isFocusing == false ? 'Pular para foco' : 'Pular para descanso',
                  onPressed: resetTimer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final ValueChanged<FocusTime> onValueSelected;
  final bool isActive;

  const MenuButton({super.key, required this.onValueSelected, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: isActive
          ? () async {
        FocusTime result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuPage()),
        );
        if (result != null) {
          onValueSelected(result);
        }
      }
          : null,
      color: Colors.black,
    );
  }
}
