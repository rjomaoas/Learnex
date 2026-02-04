import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.01),
          Container(
            padding: EdgeInsets.all(size.width * 0.03),
            width: size.width * 0.85,
            height: size.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.05),
              color: Colors.white.withOpacity(0.4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rank",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                            fontSize: size.width * 0.04),
                      ),
                      // SizedBox(height: size.height * 0.013),
                      Text(
                        "26",
                        style: TextStyle(fontSize: size.width * 0.1),
                      )
                    ],
                  ),
                ),
                Container(
                    width: size.width * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Points",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              fontSize: size.width * 0.04),
                        ),
                        // SizedBox(height: size.height * 0.008),
                        Text(
                          "2310",
                          style: TextStyle(fontSize: size.width * 0.1),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
