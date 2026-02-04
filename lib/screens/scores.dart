import 'package:flutter/material.dart';
import 'package:learnex_app/components/menu.dart';
import 'package:learnex_app/components/profile_tab.dart';
import 'package:learnex_app/components/score_row_data.dart';
import 'package:learnex_app/screens/dashboard_screen.dart';

class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Menu(),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  ProfileTab(
                    profileHeight: size.height * 0.12,
                    profileWidth: size.width * 0.2,
                    profileLabelName: "Scores",
                    onMenuPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  SizedBox(height: size.height * 0.04),
                  Container(
                    child: Text(
                      "Scores Content",
                      style: TextStyle(
                          fontSize: size.width * 0.07,
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ScoreRowData(
                      fontSize: size.width * 0.05,
                      chapterValue: "Chapter",
                      scoreValue: "Score",
                      backgroundColor: Color.fromARGB(255, 10, 32, 53),
                      textColor: Colors.white),
                  for (int i = 0; i < 10; i++) ...[
                    ScoreRowData(
                        fontSize: size.width * 0.035,
                        // rowHeight: size.height * 0.05,
                        chapterValue: "Chapter" + (i + 1).toString(),
                        scoreValue: i.toString(),
                        backgroundColor: Color.fromARGB(255, 30, 43, 113),
                        textColor: Colors.white),
                    SizedBox(height: size.height * 0.001),
                  ],
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardScreen()));
          return Future.value(false);
        });
  }
}
