import 'package:flutter/material.dart';

class ScoreRowData extends StatefulWidget {
  const ScoreRowData(
      {super.key,
      required this.chapterValue,
      required this.scoreValue,
      required this.backgroundColor,
      required this.textColor,
      this.fontSize,
      this.paddingValue});

  final String chapterValue;
  final String scoreValue;
  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  final double? paddingValue;

  @override
  State<ScoreRowData> createState() => _ScoreRowDataState();
}

class _ScoreRowDataState extends State<ScoreRowData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.85,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(widget.paddingValue ?? 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: widget.backgroundColor),
              width: size.width * 0.424,
              alignment: Alignment.center,
              child: Text(
                widget.chapterValue,
                style: TextStyle(
                    fontSize: widget.fontSize ?? size.width * 0.04,
                    color: widget.textColor,
                    fontFamily: "Roboto"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(widget.paddingValue ?? 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: widget.backgroundColor),
              width: size.width * 0.424,
              alignment: Alignment.center,
              child: Text(
                widget.scoreValue,
                style: TextStyle(
                    fontSize: widget.fontSize ?? size.width * 0.04,
                    color: widget.textColor,
                    fontFamily: "Roboto"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
