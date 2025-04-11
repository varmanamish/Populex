import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/quiz_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool quizCompleted = false;
  String? selectedSubject;

  final List<String> subjects = [
    'Constitutional Law',
    'Criminal Law',
    'Contract Law',
    'Property Law',
    'Tort Law'
  ];

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the primary source of law in India?',
      'subject': 'Constitutional Law',
      'answers': ['Judicial Decisions', 'Constitution', 'Customs', 'Statutes'],
      'correctAnswer': 'Constitution',
    },
    {
      'question':
          'Which article of the Indian Constitution deals with Fundamental Rights?',
      'subject': 'Constitutional Law',
      'answers': [
        'Article 12-35',
        'Article 36-51',
        'Article 52-78',
        'Article 79-124'
      ],
      'correctAnswer': 'Article 12-35',
    },
    {
      'question':
          'What is the maximum duration for which the President\'s rule can be imposed in a state?',
      'subject': 'Constitutional Law',
      'answers': ['6 months', '1 year', '2 years', '3 years'],
      'correctAnswer': '1 year',
    },
    {
      'question': 'Who is the final interpreter of the Indian Constitution?',
      'subject': 'Constitutional Law',
      'answers': ['President', 'Parliament', 'Supreme Court', 'Prime Minister'],
      'correctAnswer': 'Supreme Court',
    },
    {
      'question':
          'Which writ is issued to compel a public authority to perform its duty?',
      'subject': 'Constitutional Law',
      'answers': ['Habeas Corpus', 'Mandamus', 'Prohibition', 'Certiorari'],
      'correctAnswer': 'Mandamus',
    },
    {
      'question': 'What is the minimum age for becoming a member of Lok Sabha?',
      'subject': 'Constitutional Law',
      'answers': ['21 years', '25 years', '30 years', '35 years'],
      'correctAnswer': '25 years',
    },
    {
      'question':
          'Which schedule of the Indian Constitution deals with the languages?',
      'subject': 'Constitutional Law',
      'answers': [
        '7th Schedule',
        '8th Schedule',
        '9th Schedule',
        '10th Schedule'
      ],
      'correctAnswer': '8th Schedule',
    },
    {
      'question': 'Who appoints the Chief Justice of India?',
      'subject': 'Constitutional Law',
      'answers': ['President', 'Prime Minister', 'Parliament', 'Law Minister'],
      'correctAnswer': 'President',
    },
    {
      'question':
          'Which part of the Indian Constitution deals with Directive Principles of State Policy?',
      'subject': 'Constitutional Law',
      'answers': ['Part I', 'Part III', 'Part IV', 'Part V'],
      'correctAnswer': 'Part IV',
    },
    {
      'question':
          'The concept of Judicial Review is borrowed from which country?',
      'subject': 'Constitutional Law',
      'answers': ['UK', 'USA', 'France', 'Canada'],
      'correctAnswer': 'USA',
    },
  ];

  void answerQuestion(String answer) {
    if (quizCompleted) return;

    setState(() {
      selectedAnswer = answer;
      if (answer == questions[currentQuestionIndex]['correctAnswer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      selectedAnswer = null;
      quizCompleted = false;
      selectedSubject = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredQuestions = selectedSubject != null
        ? questions.where((q) => q['subject'] == selectedSubject).toList()
        : questions;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'POPULEX',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Legal Quiz',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Dropdown - Fixed version
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFECF3FF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF174AC9)),
              ),
              child: DropdownButton<String>(
                value: selectedSubject,
                hint: const Text('Select Subject'),
                isExpanded: true,
                underline: const SizedBox(),
                items: [
                  const DropdownMenuItem<String>(
                    value: null,
                    child: Text('All Subjects'),
                  ),
                  ...subjects.map((subject) {
                    return DropdownMenuItem<String>(
                      value: subject,
                      child: Text(subject),
                    );
                  }).toList(),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value;
                    currentQuestionIndex = 0;
                    quizCompleted = false;
                    score = 0;
                    selectedAnswer = null;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            if (quizCompleted)
              _buildResultCard(filteredQuestions)
            else if (filteredQuestions.isNotEmpty)
              _buildQuestionCard(filteredQuestions)
            else
              const Center(
                child: Text('No questions available for selected subject'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: const Color(0xFF174AC9)),
          onPressed: () {},
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF174AC9),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard(List<Map<String, dynamic>> filteredQuestions) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filteredQuestions[currentQuestionIndex]['subject'] ??
                'All Subjects',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF174AC9),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Question ${currentQuestionIndex + 1}/${filteredQuestions.length}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            filteredQuestions[currentQuestionIndex]['question'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: (filteredQuestions[currentQuestionIndex]['answers']
                      as List<String>)
                  .map((answer) => _buildAnswerButton(answer))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          if (selectedAnswer != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF174AC9),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: nextQuestion,
                child: Text(
                  currentQuestionIndex < filteredQuestions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(String answer) {
    final bool isSelected = selectedAnswer == answer;
    final bool isCorrect =
        answer == questions[currentQuestionIndex]['correctAnswer'];

    Color buttonColor = const Color(0xFFECF3FF);
    Color textColor = Colors.black;

    if (isSelected) {
      buttonColor = isCorrect
          ? Colors.green.withOpacity(0.2)
          : Colors.red.withOpacity(0.2);
      textColor = isCorrect ? Colors.green : Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSelected
                  ? textColor.withOpacity(0.5)
                  : const Color(0xFF174AC9).withOpacity(0.3),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () => answerQuestion(answer),
        child: Text(answer),
      ),
    );
  }

  Widget _buildResultCard(List<Map<String, dynamic>> filteredQuestions) {
    return Expanded(
      child: Center(
        child: Card(
          color: const Color(0xFFECF3FF),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Quiz Completed!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF174AC9),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Score: $score/${filteredQuestions.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${(score / filteredQuestions.length * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: score == filteredQuestions.length
                        ? Colors.green
                        : score >= filteredQuestions.length / 2
                            ? Colors.orange
                            : Colors.red,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF174AC9),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: resetQuiz,
                    child: const Text(
                      'Start New Quiz',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
