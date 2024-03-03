// ignore_for_file: prefer_final_fields

import 'question.dart';

class QuizTrain {
  int questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      q: "What is the largest planet in our solar system?",
      options: ['Earth', 'Jupiter', 'Mars', 'Venus'],
      correctOptionIndex: 1,
    ),
    Question(
      q: "How many moons does Earth have?",
      options: ['One', 'Two', 'Zero', 'Four'],
      correctOptionIndex: 0,
    ),
    Question(
      q: "Which planet is known as the 'Red Planet'?",
      options: ['Mars', 'Jupiter', 'Saturn', 'Venus'],
      correctOptionIndex: 0,
    ),
    Question(
      q: "What is the name of the first artificial satellite launched into space?",
      options: ['Sputnik 1', 'Explorer 1', 'Hubble', 'Apollo 11'],
      correctOptionIndex: 0,
    ),
    Question(
      q: "Who was the first person to walk on the Moon?",
      options: ['Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Alan Shepard'],
      correctOptionIndex: 0,
    ),
    Question(
      q: "Which galaxy does our solar system belong to?",
      options: ['Andromeda', 'Milky Way', 'Triangulum', 'Messier 87'],
      correctOptionIndex: 1,
    ),
    Question(
      q: "What is a light-year?",
      options: ['A measure of time', 'A unit of speed', 'A unit of distance', 'A type of star'],
      correctOptionIndex: 2,
    ),
    Question(
      q: "Which gas makes up the majority of the Sun?",
      options: ['Hydrogen', 'Helium', 'Oxygen', 'Carbon dioxide'],
      correctOptionIndex: 0,
    ),
    Question(
      q: "What is a supernova?",
      options: ['A type of planet', 'An exploding star', 'A black hole', 'A comet'],
      correctOptionIndex: 1,
    ),
    Question(
      q: "Who proposed the heliocentric model of the solar system?",
      options: ['Ptolemy', 'Copernicus', 'Galileo', 'Kepler'],
      correctOptionIndex: 1,
    ),
    Question(
      q: "What is the Kuiper Belt?",
      options: ['A region of space debris', 'A type of asteroid', 'A giant planet', 'A spacecraft'],
      correctOptionIndex: 0,
    ),
  ];

  String? getQuestion() {
    return _questionBank[questionNumber].questionText;
  }

  List<String>? getOptions() {
    return _questionBank[questionNumber].options;
  }

  int? getCorrectOptionIndex() {
    return _questionBank[questionNumber].correctOptionIndex;
  }

  void nextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
    }
  }
}
