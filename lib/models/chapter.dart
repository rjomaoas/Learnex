import 'question.dart';

class Chapter {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  Chapter({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });
}