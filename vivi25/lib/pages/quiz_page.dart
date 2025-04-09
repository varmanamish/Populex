import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/quiz_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> quizzes = [
    {
      'title': 'Basic Legal Knowledge',
      'questions': [
        {
          'question': 'What is the primary source of law in India?',
          'options': [
            'Judicial Decisions',
            'Constitution',
            'Customs',
            'Statutes'
          ],
          'correctAnswer': 'Constitution'
        },
        // More questions...
      ],
    },
  ];

  String lastQuizRating = 'N/A';
  int userPoints = 250;
  String? selectedQuizAnswer;
  int currentQuizIndex = 0;
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Legal Quiz',
                textStyle:
                    const TextStyle(color: Color(0xFFFFC107), fontSize: 24),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QuizCard(
              quizzes: quizzes,
              currentQuizIndex: currentQuizIndex,
              correctAnswers: correctAnswers,
              selectedQuizAnswer: selectedQuizAnswer,
              onAnswerSelected: (value) =>
                  setState(() => selectedQuizAnswer = value),
              onNextPressed: () {
                setState(() {
                  if (selectedQuizAnswer ==
                      quizzes[0]['questions'][currentQuizIndex]
                          ['correctAnswer']) {
                    correctAnswers++;
                  }
                  if (currentQuizIndex < quizzes[0]['questions'].length - 1) {
                    currentQuizIndex++;
                    selectedQuizAnswer = null;
                  }
                });
              },
              onPreviousPressed: currentQuizIndex > 0
                  ? () => setState(() {
                        currentQuizIndex--;
                        selectedQuizAnswer = null;
                      })
                  : null,
              onRestartPressed: () => setState(() {
                currentQuizIndex = 0;
                correctAnswers = 0;
                selectedQuizAnswer = null;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
