import 'package:flutter/material.dart';
import '../widgets/round-button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

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
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            title: Text(
              'Pomodoro',
              style: TextStyle(color: Colors.black, fontFamily: 'Titi'),
            ),
          ),
          body: pomoTimer(),
        ));
  }
}


class pomoTimer extends StatefulWidget {
  const pomoTimer({super.key});

  @override
  _pomoTimerState createState() => _pomoTimerState();
}

class _pomoTimerState extends State<pomoTimer> with TickerProviderStateMixin  {

  late AnimationController controller;
  bool isCounting = false;


  String get countText{
    Duration count = controller.duration! * controller.value;
    if(controller.value == 0){
      count = Duration(seconds: 10);
    }
    return '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void zerado() {
    if(controller.value == 0){
      setState(() {
        isCounting = false;
      });
    }
  }

  double progress = 1.0;

  void notify() {
    if(countText == '00:00:00'){
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: 10
      ),
    );
    controller.addListener((){
      notify();
      if(controller.isAnimating){
        setState(() {
          progress = controller.value;
        });
      }else {
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
      backgroundColor: Color(0xfff5fbff),
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
                      style: TextStyle(
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
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              children: [
                RoundButton(
                  text: isCounting == true ? 'Pausar' : 'Iniciar',
                  onPressed: () {
                    if(controller.isAnimating){
                      controller.stop();
                      setState(() {
                        isCounting = false;
                      });
                    }else{
                      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isCounting = true;
                      });
                    }
                  },
                ),
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
