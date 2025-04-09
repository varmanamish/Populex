import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
          'options': ['Judicial Decisions', 'Constitution', 'Customs', 'Statutes'],
          'correctAnswer': 'Constitution'
        },
        // ... (other 9 questions remain the same as previous)
        {
          'question': 'Which body interprets the Constitution?',
          'options': ['Parliament', 'Supreme Court', 'President', 'Cabinet'],
          'correctAnswer': 'Supreme Court'
        },
      ],
    },
    // ... (other quizzes remain the same as previous)
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
                textStyle: const TextStyle(color: Color(0xFFFFC107), fontSize: 24),
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
            Card(
              color: const Color(0xFF4A6B6F),
              child: ListTile(
                title: DropdownButton<String>(
                  value: quizzes.length > 1 ? quizzes[0]['title'] : null,
                  hint: const Text('Select Quiz', style: TextStyle(color: Color(0xFFF5F6F5))),
                  items: quizzes.map((quiz) {
                    return DropdownMenuItem<String>(
                      value: quiz['title'],
                      child: Text(quiz['title']!, style: const TextStyle(color: Color(0xFFF5F6F5))),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      currentQuizIndex = 0;
                      correctAnswers = 0;
                      selectedQuizAnswer = null;
                    });
                  },
                  style: const TextStyle(color: Color(0xFFF5F6F5)),
                  dropdownColor: const Color(0xFF1E2A44),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (currentQuizIndex < quizzes[0]['questions'].length)
              Expanded(
                child: Card(
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
                        ...quizzes[0]['questions'][currentQuizIndex]['options'].map<Widget>((option) {
                          return RadioListTile<String>(
                            title: Text(option, style: const TextStyle(color: Color(0xFFF5F6F5))),
                            value: option,
                            groupValue: selectedQuizAnswer,
                            onChanged: (value) {
                              setState(() {
                                selectedQuizAnswer = value;
                              });
                            },
                            activeColor: const Color(0xFF00A86B),
                          );
                        }).toList(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (currentQuizIndex > 0)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    currentQuizIndex--;
                                    selectedQuizAnswer = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A6B6F)),
                                child: const Text('Previous'),
                              ),
                            ElevatedButton(
                              onPressed: selectedQuizAnswer == null
                                  ? null
                                  : () {
                                      setState(() {
                                        if (selectedQuizAnswer ==
                                            quizzes[0]['questions'][currentQuizIndex]['correctAnswer']) {
                                          correctAnswers++;
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Correct!'),
                                              backgroundColor: Color(0xFF00A86B),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Wrong!'),
                                              backgroundColor: Color(0xFFD32F2F),
                                            ),
                                          );
                                        }
                                        if (currentQuizIndex < quizzes[0]['questions'].length - 1) {
                                          currentQuizIndex++;
                                          selectedQuizAnswer = null;
                                        }
                                      });
                                    },
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A6B6F)),
                              child: currentQuizIndex == quizzes[0]['questions'].length - 1
                                  ? const Text('Finish')
                                  : const Text('Next'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (currentQuizIndex == quizzes[0]['questions'].length)
              Card(
                color: const Color(0xFF1E2A44),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Quiz Completed!',
                        style: TextStyle(color: Color(0xFFFFC107), fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Score: $correctAnswers/${quizzes[0]['questions'].length}',
                        style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentQuizIndex = 0;
                            correctAnswers = 0;
                            selectedQuizAnswer = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A6B6F)),
                        child: const Text('Restart Quiz'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}