import 'package:Pomodoro/config-menu.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MenuPage()));
      },
      child: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
    );
  }
}


