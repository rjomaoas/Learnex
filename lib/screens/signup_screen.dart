import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/app_logo.dart';
import 'package:learnex_app/components/button.dart ';
import 'package:learnex_app/screens/main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(
                      textColor: Colors.black,
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextField(decoration: InputDecoration(labelText: 'Name')),
                    TextField(decoration: InputDecoration(labelText: 'Email')),
                    TextField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Sign Up'),
                      ),
                    )
                  ],
                ),
              ),
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
