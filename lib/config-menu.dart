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
    return Scaffold(
      backgroundColor: Color(0xfff5fbff),
      body: Column(
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
              Container(
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
                  controller: TextEditingController(text: '00'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '25'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '00'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '00'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '05'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '00'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '00'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '10'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
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
              Container(
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
                  controller: TextEditingController(text: '00'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                  ),
                  // Aumente o tamanho da fonte aqui
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // Remove a linha preta abaixo do texto
                    contentPadding: EdgeInsets.all(
                        10.0), // Adiciona preenchimento ao redor do texto
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
            child: RoundButton(
              text: 'Salvar',
              onPressed: () {}
            ),
          ),
        ],
      ),
    );
  }
}
