import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.resolveWith<Size>(
                  (Set<WidgetState> states) {
                    return Size(132, 54);
              },
            ),
            shape: WidgetStateProperty.resolveWith<OutlinedBorder?>(
                  (Set<WidgetState> states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                );
              },
            ),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            side: WidgetStateProperty.all<BorderSide>(
                BorderSide(color: Colors.black, width: 1.0)),
          ),
          onPressed: onPressed, // Chama a função passada
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontFamily: 'Titi',),
          )),
    );
  }
}
