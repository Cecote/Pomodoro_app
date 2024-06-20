import 'package:flutter/material.dart';
import '../widgets/round-button.dart';
import 'package:Pomodoro/config-menu.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: MenuButton(onValueSelected: (value) {
          _pomoTimerKey.currentState?.setFocusTime(value);
        }),
        title: const Text(
          'Pomodoro',
          style: TextStyle(color: Colors.black, fontFamily: 'Titi'),
        ),
      ),
      body: PomoTimer(key: _pomoTimerKey),
    );
  }
}

class PomoTimer extends StatefulWidget {
  const PomoTimer({Key? key}) : super(key: key);

  @override
  _PomoTimerState createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimer> with TickerProviderStateMixin {
  late AnimationController controller;
  final player = AudioPlayer();
  bool isCounting = false;
  int focusTimerH = 0;
  int focusTimerM = 25;
  int focusTimerS = 0;
  int shortBreakTimerH = 0;
  int shortBreakTimerM = 5;
  int shortBreakTimerS = 0;
  int longBreakTimerH = 0;
  int longBreakTimerM = 10;
  int longBreakTimerS = 0;


  String get countText {
    Duration count = controller.duration! * controller.value;
    if (controller.value == 0) {
      count = Duration(hours: focusTimerH, minutes: focusTimerM, seconds: focusTimerS);
    }
    return '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void zerado() {
    if (controller.value == 0) {
      setState(() {
        isCounting = false;
      });
    }
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00:00:00') {
      player.play(AssetSource('notify.mp3'));
    }
  }

  void setFocusTime(FocusTime focusTime) {
    setState(() {
      focusTimerH = focusTime.hours;
      focusTimerM = focusTime.minutes;
      focusTimerS = focusTime.seconds;
      print('Focus Time: $focusTimerH:$focusTimerM:$focusTimerS');
      controller.duration = Duration(
        hours: focusTimerH,
        minutes: focusTimerM,
        seconds: focusTimerS,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        hours: focusTimerH,
        minutes: focusTimerM,
        seconds: focusTimerS,
      ),
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
          isCounting = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fbff),
      body: Column(
        children: [
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
                      });
                    } else {
                      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isCounting = true;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                RoundButton(
                  text: 'Parar',
                  onPressed: () {
                    controller.reset();
                    setState(() {
                      isCounting = false;
                    });
                  },
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

  const MenuButton({required this.onValueSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MenuPage())).then((value) {
          if (value != null) {
            onValueSelected(value);
          }
        });
      },
      child: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
    );
  }
}

