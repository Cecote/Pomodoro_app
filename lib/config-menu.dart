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

class PomodoroConfig extends StatelessWidget {
  const PomodoroConfig({super.key});

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
                  CustomTextField(controller: TextEditingController(text: '00')),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(controller: TextEditingController(text: '25')),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(controller: TextEditingController(text: '00')),
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
                  CustomTextField(controller: TextEditingController(text: '00')),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(controller: TextEditingController(text: '05')),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(controller: TextEditingController(text: '00')),
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
                  CustomTextField(controller: TextEditingController(text: '00')),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(controller: TextEditingController(text: '10')),
                  SizedBox(
                    width: 20.0,
                    height: 50.0,
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      ':',
                    ),
                  ),
                  CustomTextField(controller: TextEditingController(text: '00')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
                child: RoundButton(
                    text: 'Salvar',
                    onPressed: () {}
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

  CustomTextField({required this.controller});

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
        onSubmitted: (value) {
          if (value.length == 1) {
            controller.text = '0' + value;
          }
        },
      ),
    );
  }
}
