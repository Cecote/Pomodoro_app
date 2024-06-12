import 'package:flutter/material.dart';
import '../widgets/round-button.dart';

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
              style: TextStyle(color: Colors.black),
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
      if(!controller.isAnimating){
        setState(() {
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
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Text(
                  countText,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
