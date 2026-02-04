import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.textColor, this.textLabel});

  final Color? textColor;
  final String? textLabel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Image.asset(
            'assets/images/learnex_app_logo.png',
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: size.height * 0.3),
          child: Text(
            textLabel ?? 'Learnex',
            style: TextStyle(
              fontSize: size.width * 0.13,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
              fontFamily: "ZillaSlab",
            ),
          ),
        )
      ],
    );
  }
}
