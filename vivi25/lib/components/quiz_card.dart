import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final List<Map<String, dynamic>> quizzes;
  final int currentQuizIndex;
  final int correctAnswers;
  final String? selectedQuizAnswer;
  final ValueChanged<String?> onAnswerSelected;
  final VoidCallback onNextPressed;
  final VoidCallback? onPreviousPressed;
  final VoidCallback onRestartPressed;

  const QuizCard({
    super.key,
    required this.quizzes,
    required this.currentQuizIndex,
    required this.correctAnswers,
    required this.selectedQuizAnswer,
    required this.onAnswerSelected,
    required this.onNextPressed,
    this.onPreviousPressed,
    required this.onRestartPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (currentQuizIndex < quizzes[0]['questions'].length) {
      return Card(
        color: const Color(0xFF1E2A44),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ${currentQuizIndex + 1}/${quizzes[0]['questions'].length}',
                style: const TextStyle(color: Color(0xFFFFC107), fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                quizzes[0]['questions'][currentQuizIndex]['question'],
                style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ...quizzes[0]['questions'][currentQuizIndex]['options']
                  .map<Widget>((option) {
                return RadioListTile<String>(
                  title: Text(option,
                      style: const TextStyle(color: Color(0xFFF5F6F5))),
                  value: option,
                  groupValue: selectedQuizAnswer,
                  onChanged: onAnswerSelected,
                  activeColor: const Color(0xFF00A86B),
                );
              }).toList(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (onPreviousPressed != null)
                    ElevatedButton(
                      onPressed: onPreviousPressed,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A6B6F)),
                      child: const Text('Previous'),
                    ),
                  ElevatedButton(
                    onPressed:
                        selectedQuizAnswer == null ? null : onNextPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A6B6F)),
                    child: Text(
                      currentQuizIndex == quizzes[0]['questions'].length - 1
                          ? 'Finish'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        color: const Color(0xFF1E2A44),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Quiz Completed!',
                style: TextStyle(
                    color: Color(0xFFFFC107),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Score: $correctAnswers/${quizzes[0]['questions'].length}',
                style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestartPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A6B6F)),
                child: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
