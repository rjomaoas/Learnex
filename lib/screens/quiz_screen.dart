import 'package:flutter/material.dart';
import '../models/chapter.dart';
import '../services/progress_service.dart';

class QuizScreen extends StatefulWidget {
  final Chapter chapter;
  const QuizScreen({super.key, required this.chapter});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;
  int selected = -1;

  void next() {
    if (selected == widget.chapter.questions[index].correctIndex) {
      score++;
    }

    if (index < widget.chapter.questions.length - 1) {
      setState(() {
        index++;
        selected = -1;
      });
    } else {
      ProgressService.markCompleted(widget.chapter.id);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Finished'),
          content: Text('Score: $score/${widget.chapter.questions.length}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
              child: const Text('Done'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.chapter.questions[index];
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q.text, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ...q.options.asMap().entries.map(
              (e) => RadioListTile(
                value: e.key,
                groupValue: selected,
                title: Text(e.value),
                onChanged: (v) => setState(() => selected = v as int),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selected == -1 ? null : next,
                child: Text(index == widget.chapter.questions.length - 1
                    ? 'Finish'
                    : 'Next'),
              ),
            )
          ],
        ),
      ),
    );
  }
}