import 'package:flutter/material.dart';


class MenuItens extends StatelessWidget {
  const MenuItens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                side: WidgetStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.black, width: 1.0)),
              minimumSize: WidgetStateProperty.all(Size(40, 30)),
              backgroundColor: WidgetStateProperty.all(Colors.white)
            ),
            onPressed: () {},
            child: Text(
              'Configurar',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Titi'
              ),
            ),
          ),
        ),
      ],
    );
  }
}
