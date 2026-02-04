import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/button.dart';
import 'package:learnex_app/components/app_logo.dart';
import 'package:learnex_app/screens/initial_screen.dart';

// Screens
import 'package:learnex_app/screens/login_screen.dart';
import 'package:learnex_app/screens/signup_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: Container(
            width: size.width,
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
            child: Column(
              children: [
                AppLogo(),
                SizedBox(height: size.height * 0.05),
                Button(
                  label: "Login",
                  textColor: Color.fromARGB(255, 29, 12, 84),
                  backgroundColor: Colors.white,
                  borderRadius: size.width * 0.2,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Button(
                  label: "Signup",
                  textColor: Color.fromARGB(255, 29, 12, 84),
                  backgroundColor: Colors.white,
                  borderRadius: size.width * 0.2,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                ),
                SizedBox(height: size.height * 0.1),
                Button(
                  icon: Icon(Icons.facebook, color: Colors.white),
                  labelFontSize: size.height * 0.02,
                  label: "Login with Facebook",
                  textColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 70, 61, 242),
                  borderRadius: size.width * 0.2,
                ),
                SizedBox(height: size.height * 0.02),
                Button(
                  icon: Icon(Icons.email, color: Colors.white),
                  labelFontSize: size.height * 0.02,
                  label: "Login with Google",
                  textColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 253, 84, 0),
                  borderRadius: size.width * 0.2,
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InitialScreen()));
          return Future.value(false);
        });
  }
}
