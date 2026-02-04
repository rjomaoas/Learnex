import 'package:flutter/material.dart';
import '../models/chapter.dart';
import 'quiz_screen.dart';

class LessonScreen extends StatelessWidget {
  final Chapter chapter;
  const LessonScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapter.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Text(
                'Lesson content for ${chapter.title}. '
                'This simulates reading material before taking the quiz.',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Start Quiz'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(chapter: chapter),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}