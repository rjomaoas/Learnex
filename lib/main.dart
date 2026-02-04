import 'package:flutter/material.dart';
import 'screens/initial_screen.dart';

void main() {
  runApp(const LearnexApp());
}

class LearnexApp extends StatelessWidget {
  const LearnexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learnex',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        cardTheme: CardTheme(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: InitialScreen(),
    );
  }
}
