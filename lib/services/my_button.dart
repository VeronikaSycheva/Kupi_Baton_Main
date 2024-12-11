import 'package:flutter/material.dart';
import 'package:untitled/services/my_text.dart';

class MyButton extends StatelessWidget {
  final String textButton;
  final Function()? onTap;
  const MyButton({
    super.key,
    required this.textButton,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.zero, right: Radius.zero),
            color: Color.fromARGB(255, 53, 29, 71),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Center(
            child: MyText(
              text: textButton,
              isTitle: false,
              isDark: false,
            )
          )
      )
    );
  }
}


