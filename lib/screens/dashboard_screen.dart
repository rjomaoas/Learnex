import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/profile_tab.dart';
import 'package:learnex_app/components/button.dart';
import 'package:learnex_app/components/menu.dart';

// Screens
import 'package:learnex_app/screens/main_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        bool? shouldLogout = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                  );
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );

        return shouldLogout ?? false;
      },
      child: Scaffold(
        drawer: Menu(),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProfileTab(
                    onMenuPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  SizedBox(height: size.height * 0.1),
                  Text(
                    "Welcome to Learnex",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Test your tech knowledge and climb the leaderboard",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: size.width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.2),
                  Button(
                    label: "Start Learning",
                    textColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 10, 32, 53),
                    borderRadius: size.width * 0.1,
                    buttonWidth: size.width * 0.6,
                    onPressed: () {
                      // Navigate to learning screen
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
