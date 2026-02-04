import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/app_logo.dart';
import 'package:learnex_app/components/button.dart ';
import 'package:learnex_app/components/loading_icon.dart';

// Screens
import 'package:learnex_app/screens/dashboard_screen.dart';
import 'package:learnex_app/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLogo(
                        textColor: Colors.black,
                      ),
                      SizedBox(height: size.height * 0.03),
                      TextField(
                          decoration: InputDecoration(labelText: 'Email')),
                      TextField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true),
                      SizedBox(height: size.height * 0.04),
                      Button(
                        label: "Login",
                        textColor: Colors.white,
                        labelFontSize: size.height * 0.02,
                        backgroundColor: Color.fromARGB(255, 39, 6, 146),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()));
                        },
                      )
                    ],
                  ),
                ),
                if (isLoading) Loading(),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
          return false;
        });
  }
}
