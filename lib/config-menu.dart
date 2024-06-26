import 'package:Pomodoro/widgets/round-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController focusHoursController =
  TextEditingController(text: '00');
  final TextEditingController focusMinutesController =
  TextEditingController(text: '25');
  final TextEditingController focusSecondsController =
  TextEditingController(text: '00');
  final TextEditingController shortBreakHoursController =
  TextEditingController(text: '00');
  final TextEditingController shortBreakMinutesController =
  TextEditingController(text: '05');
  final TextEditingController shortBreakSecondsController =
  TextEditingController(text: '00');
  final TextEditingController longBreakHoursController =
  TextEditingController(text: '00');
  final TextEditingController longBreakMinutesController =
  TextEditingController(text: '10');
  final TextEditingController longBreakSecondsController =
  TextEditingController(text: '00');
  final TextEditingController numeberCycles = TextEditingController(text: '04');

  String focusHours = '00';
  String focusMinutes = '25';
  String focusSeconds = '00';
  String shortBreakHours = '00';
  String shortBreakMinutes = '05';
  String shortBreakSeconds = '00';
  String longBreakHours = '00';
  String longBreakMinutes = '10';
  String longBreakSeconds = '00';
  String cycles = '04';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5fbff),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              // Reserve espaço para o botão
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tempo para focar',
                      style: TextStyle(fontSize: 20, fontFamily: 'Titi'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tempo para descansar (Curto)',
                      style: TextStyle(fontSize: 20, fontFamily: 'Titi'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  /*
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tempo para descansar (Longo)',
                      style: TextStyle(fontSize: 20, fontFamily: 'Titi'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  */
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Quantidade de ciclos de foco',
                      style: TextStyle(fontSize: 20, fontFamily: 'Titi'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: numeberCycles,
                        onChanged: (value) {
                          setState(() {
                            cycles = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: RoundButton(
                text: 'Salvar',
                onPressed: () {
                  // Implemente a lógica de salvar aqui
                  print('Focus Time: $focusHours:$focusMinutes:$focusSeconds');
                  print(
                      'Short Break Time: $shortBreakHours:$shortBreakMinutes:$shortBreakSeconds');
                  print(
                      'Long Break Time: $longBreakHours:$longBreakMinutes:$longBreakSeconds');
                  FocusTime focusTime = FocusTime(
                      int.parse(focusHours),
                      int.parse(focusMinutes),
                      int.parse(focusSeconds),
                      int.parse(shortBreakHours),
                      int.parse(shortBreakMinutes),
                      int.parse(shortBreakSeconds),
                      int.parse(longBreakHours),
                      int.parse(longBreakMinutes),
                      int.parse(longBreakSeconds),
                      int.parse(cycles)
                  );
                  Navigator.pop(context, focusTime);
                },
              ),
            ),
          ),
        ],
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
            onChanged('0' +
                value); // Ensure the state is updated with the padded value
          }
          if (value.length == 0) {
            controller.text = '00';
            onChanged('00');
          }
        },
      ),
    );
  }
}

class FocusTime {
  final int focusHours;
  final int focusMinutes;
  final int focusSeconds;
  final int shortBreakHours;
  final int shortBreakMinutes;
  final int shortBreakSeconds;
  final int longBreakHours;
  final int longBreakMinutes;
  final int longBreakSeconds;
  final int cycles;

  FocusTime(
      this.focusHours,
      this.focusMinutes,
      this.focusSeconds,
      this.shortBreakHours,
      this.shortBreakMinutes,
      this.shortBreakSeconds,
      this.longBreakHours,
      this.longBreakMinutes,
      this.longBreakSeconds,
      this.cycles);
}
