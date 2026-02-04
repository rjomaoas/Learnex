import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/app_logo.dart';
import 'package:learnex_app/screens/dashboard_screen.dart';
import 'package:learnex_app/screens/scores.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Drawer has a 'child', ListView has 'children'
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
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
                ), // Your navy blue
              ),
              child: AppLogo()),
          ListTile(
            leading: Icon(Icons.view_module),
            title: Text('Module'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('Scores'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Scores()));
            },
          ),

          ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text('Leaderboard'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.pop(context),
          ),

          // Add more ListTiles here...
        ],
      ),
    );
  }
}
