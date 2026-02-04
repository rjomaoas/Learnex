import 'package:flutter/material.dart';
import 'package:learnex_app/components/app_logo.dart';
import 'package:learnex_app/screens/main_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // 1. Create a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
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
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.score),
                  title: Text('Scores'),
                  onTap: () => Navigator.pop(context),
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
          ),
          body: Container(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.width * 0.1),
                      bottomRight: Radius.circular(size.width * 0.1),
                    ),
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
                      SizedBox(height: size.height * 0.03),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: TextButton(
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: size.height * 0.05,
                            ),
                            onPressed: () {
                              // setState(() {
                              //   isOpen = isOpen ? false : true;
                              // });

                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Container(
                        height: size.height * 0.25,
                        width: size.width * 0.43,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.5)),
                        child: Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        child: Text(
                          "Profile Name",
                          style: TextStyle(
                              fontSize: size.width * 0.08,
                              fontFamily: "ZillaSlab",
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          // Trigger the alert dialog and wait for the result
          bool? shouldLogout = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Logout'),
              content: Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  }, // Stay in app
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }, // Log out/Exit
                  child: Text(
                    'Yes',
                  ),
                ),
              ],
            ),
          );

          // If the user clicks outside the dialog, shouldLogout is null, so we return false
          return shouldLogout ?? false;
        });
  }
}
