import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static Future<void> markCompleted(String chapterId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(chapterId, true);
  }

  static Future<bool> isCompleted(String chapterId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(chapterId) ?? false;
  }
}