import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button(
      {super.key,
      required this.label,
      this.onPressed,
      required this.textColor,
      required this.backgroundColor,
      this.borderRadius,
      this.labelFontSize,
      this.buttonWidth,
      this.icon});

  final String label;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final double? borderRadius;
  final double? labelFontSize;
  final double? buttonWidth;
  final Icon? icon;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.buttonWidth ?? size.width * 0.8,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      ),
      child: TextButton(
        onPressed: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) widget.icon!,
            if (widget.icon != null) SizedBox(width: size.width * 0.05),
            Text(
              widget.label,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.labelFontSize ?? 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
