import 'package:flutter/material.dart';
import '../models/chapter.dart';
import '../models/question.dart';
import '../services/progress_service.dart';
import 'lesson_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = [
      Chapter(
        id: 'ch1',
        title: 'Chapter 1',
        description: 'Flutter Basics',
        questions: [
          Question(
            text: 'Flutter is developed by?',
            options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
            correctIndex: 1,
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lessons')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chapters.length,
        itemBuilder: (_, i) {
          final ch = chapters[i];
          return FutureBuilder<bool>(
            future: ProgressService.isCompleted(ch.id),
            builder: (c, snap) {
              final done = snap.data ?? false;
              return Card(
                child: ListTile(
                  title: Text(ch.title),
                  subtitle: Text(ch.description),
                  trailing: Icon(done ? Icons.check_circle : Icons.arrow_forward,
                      color: done ? Colors.green : null),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LessonScreen(chapter: ch)),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}