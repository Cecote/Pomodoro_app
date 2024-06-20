import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/round-button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Pomodoro',
          style: TextStyle(color: Colors.black, fontFamily: 'Titi'),
        ),
      ),
      body: PomodoroConfig(),
    );
  }
}

class PomodoroConfig extends StatefulWidget {
  const PomodoroConfig({super.key});

  @override
  _PomodoroConfigState createState() => _PomodoroConfigState();
}

class _PomodoroConfigState extends State<PomodoroConfig> {
  final TextEditingController focusHoursController = TextEditingController(text: '00');
  final TextEditingController focusMinutesController = TextEditingController(text: '25');
  final TextEditingController focusSecondsController = TextEditingController(text: '00');
  final TextEditingController shortBreakHoursController = TextEditingController(text: '00');
  final TextEditingController shortBreakMinutesController = TextEditingController(text: '05');
  final TextEditingController shortBreakSecondsController = TextEditingController(text: '00');
  final TextEditingController longBreakHoursController = TextEditingController(text: '00');
  final TextEditingController longBreakMinutesController = TextEditingController(text: '10');
  final TextEditingController longBreakSecondsController = TextEditingController(text: '00');

  String focusHours = '00';
  String focusMinutes = '25';
  String focusSeconds = '00';
  String shortBreakHours = '00';
  String shortBreakMinutes = '05';
  String shortBreakSeconds = '00';
  String longBreakHours = '00';
  String longBreakMinutes = '10';
  String longBreakSeconds = '00';

  @override
  Widget build(BuildContext context) {
    // Obter a altura do teclado
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Color(0xfff5fbff),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset), // Adiciona padding na parte inferior
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Tempo para focar',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Titi'
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    controller: focusHoursController,
                    onChanged: (value) {
                      setState(() {
                        focusHours = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(
                    controller: focusMinutesController,
                    onChanged: (value) {
                      setState(() {
                        focusMinutes = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(
                    controller: focusSecondsController,
                    onChanged: (value) {
                      setState(() {
                        focusSeconds = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Tempo para descansar (Curto)',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Titi'
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    controller: shortBreakHoursController,
                    onChanged: (value) {
                      setState(() {
                        shortBreakHours = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(
                    controller: shortBreakMinutesController,
                    onChanged: (value) {
                      setState(() {
                        shortBreakMinutes = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(
                    controller: shortBreakSecondsController,
                    onChanged: (value) {
                      setState(() {
                        shortBreakSeconds = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Tempo para descansar (Longo)',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Titi'
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    controller: longBreakHoursController,
                    onChanged: (value) {
                      setState(() {
                        longBreakHours = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(
                    controller: longBreakMinutesController,
                    onChanged: (value) {
                      setState(() {
                        longBreakMinutes = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(
                    controller: longBreakSecondsController,
                    onChanged: (value) {
                      setState(() {
                        longBreakSeconds = value;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
                child: RoundButton(
                    text: 'Salvar',
                    onPressed: () {
                      // Implemente a lógica de salvar aqui
                      print('Focus Time: $focusHours:$focusMinutes:$focusSeconds');
                      print('Short Break Time: $shortBreakHours:$shortBreakMinutes:$shortBreakSeconds');
                      print('Long Break Time: $longBreakHours:$longBreakMinutes:$longBreakSeconds');
                      Navigator.pop(context, int.parse(focusMinutes));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  CustomTextField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'Montserrat',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10.0),
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
        onChanged: onChanged,
        onSubmitted: (value) {
          if (value.length == 1) {
            controller.text = '0' + value;
            onChanged('0' + value);  // Ensure the state is updated with the padded value
          }
        },
      ),
    );
  }
}
