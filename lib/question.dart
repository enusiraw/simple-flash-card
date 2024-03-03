// ignore_for_file: prefer_initializing_formals

class Question {
  late String questionText;
  late List<String> options;
  late int correctOptionIndex;

  Question({
    String q = '',
    List<String>? options,
    int correctOptionIndex = 0,
  }) {
    questionText = q;
    this.options = options ?? [];
    this.correctOptionIndex = correctOptionIndex;
  }
}
