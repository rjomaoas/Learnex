import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/app_logo.dart';
import 'package:learnex_app/components/button.dart';

// Screens
import 'package:learnex_app/screens/main_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 5, 16, 26),
              Color.fromARGB(255, 10, 32, 53),
              Color.fromARGB(255, 30, 43, 113),
              Color.fromARGB(255, 10, 32, 53),
              Color.fromARGB(255, 5, 16, 26)
            ],
          ),
        ),
        width: size.width,
        child: Column(children: [
          SizedBox(height: size.height * 0.1),
          AppLogo(),
          SizedBox(height: size.height * 0.2),
          Button(
            label: "Get Started",
            textColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 62, 52, 138),
            borderRadius: size.width * 0.2,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          )
        ]),
      ),
    );
  }
}
