import 'package:flutter/material.dart';
import 'package:pomodoro/widgets/menu-itens.dart';
import 'package:popover/popover.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
    );
  }
}


