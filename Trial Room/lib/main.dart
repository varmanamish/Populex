import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trial Room',
      theme: ThemeData(
        primaryColor: const Color(0xFF174AC9),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Color(0xFF174AC9)),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePageContent(),
    TrialRoomPage(),
    QuizPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          _selectedIndex == 0
              ? 'Home'
              : _selectedIndex == 1
                  ? 'Trial Room'
                  : _selectedIndex == 2
                      ? 'Quiz'
                      : 'Profile',
          style: const TextStyle(color: Color(0xFF174AC9)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF174AC9)),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gavel, size: 24),
              label: 'Trial Room',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, size: 24),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF174AC9),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            color: const Color(0xFF174AC9),
            child: PageView(
              children: [
                Container(
                  color: const Color(0xFF174AC9),
                  child: const Center(
                    child: Text(
                      'Carousel Item 1',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFF174AC9),
                  child: const Center(
                    child: Text(
                      'Carousel Item 2',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFF174AC9),
                  child: const Center(
                    child: Text(
                      'Carousel Item 3',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: const ServicesCard(),
        ),
      ],
    );
  }
}

class ServicesCard extends StatelessWidget {
  const ServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(16.0),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildServiceIcon(Icons.remove_red_eye, 'Spectate'),
                _buildServiceIcon(Icons.newspaper, 'News Board'),
                _buildServiceIcon(Icons.school, 'Courses'),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildServiceIcon(Icons.description, 'Doc Summarizer'),
                _buildServiceIcon(Icons.book, 'Previous Cases'),
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFFACD4FC),
          child: Icon(icon, size: 30, color: const Color(0xFF174AC9)),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(color: Colors.black87, fontSize: 12),
        ),
      ],
    );
  }
}

class TrialRoomPage extends StatefulWidget {
  const TrialRoomPage({super.key});

  @override
  State<TrialRoomPage> createState() => _TrialRoomPageState();
}

class _TrialRoomPageState extends State<TrialRoomPage> {
  String _selectedCategory = 'All';

  final Map<String, List<Map<String, String>>> cases = {
    'All': [
      {
        'title': 'State vs. John Doe',
        'description': 'A high-profile murder case involving a disputed alibi. Evidence includes witness testimonies and forensic reports. The case has drawn significant media attention.',
        'minRating': '60',
        'type': 'Criminal Cases'
      },
      {
        'title': 'Smith vs. ABC Corp',
        'description': 'Civil dispute over a breached business contract. Involves financial compensation and legal documentation. Ongoing negotiations have failed.',
        'minRating': '50',
        'type': 'Civil Cases'
      },
      {
        'title': 'Green Earth PIL',
        'description': 'Public interest litigation on deforestation. Evidence includes satellite imagery and expert testimonies. Aims to enforce environmental laws.',
        'minRating': '70',
        'type': 'Environmental/Public Interest'
      },
      {
        'title': 'Consumer vs. XYZ Ltd',
        'description': 'Consumer complaint about defective products. Evidence includes product samples and customer complaints. Seeks refund and damages.',
        'minRating': '40',
        'type': 'Consumer Cases'
      },
    ],
    'Criminal Cases': [
      {
        'title': 'State vs. John Doe',
        'description': 'A high-profile murder case involving a disputed alibi. Evidence includes witness testimonies and forensic reports. The case has drawn significant media attention.',
        'minRating': '60',
        'type': 'Criminal Cases'
      },
    ],
    'Civil Cases': [
      {
        'title': 'Smith vs. ABC Corp',
        'description': 'Civil dispute over a breached business contract. Involves financial compensation and legal documentation. Ongoing negotiations have failed.',
        'minRating': '50',
        'type': 'Civil Cases'
      },
    ],
    'Consumer Cases': [
      {
        'title': 'Consumer vs. XYZ Ltd',
        'description': 'Consumer complaint about defective products. Evidence includes product samples and customer complaints. Seeks refund and damages.',
        'minRating': '40',
        'type': 'Consumer Cases'
      },
    ],
    'Environmental/Public Interest': [
      {
        'title': 'Green Earth PIL',
        'description': 'Public interest litigation on deforestation. Evidence includes satellite imagery and expert testimonies. Aims to enforce environmental laws.',
        'minRating': '70',
        'type': 'Environmental/Public Interest'
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedCategory = cases.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final filteredCases = cases[_selectedCategory] ?? [];

    if (filteredCases.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Trial Room', style: TextStyle(color: Color(0xFF174AC9))),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(
          child: Text('No cases available', style: TextStyle(color: Colors.black87)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial Room', style: TextStyle(color: Color(0xFF174AC9))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton('All', _selectedCategory == 'All'),
                  _buildCategoryButton('Criminal Cases', _selectedCategory == 'Criminal Cases'),
                  _buildCategoryButton('Civil Cases', _selectedCategory == 'Civil Cases'),
                  _buildCategoryButton('Consumer Cases', _selectedCategory == 'Consumer Cases'),
                  _buildCategoryButton('Environmental/Public Interest', _selectedCategory == 'Environmental/Public Interest'),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select a Case',
              style: TextStyle(color: Color(0xFF174AC9), fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCases.length,
              itemBuilder: (context, index) {
                final caseData = filteredCases[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CaseDetailPage(
                          caseData: caseData,
                          userRating: 65,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color(0xFFE6F3FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              caseData['title']!,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              caseData['description']!.split('\n').first,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Min Rating: ${caseData['minRating']}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedCategory = label;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF174AC9) : const Color(0xFFACD4FC),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black87)),
      ),
    );
  }
}

class CaseDetailPage extends StatefulWidget {
  final Map<String, String> caseData;
  final int userRating;

  const CaseDetailPage({super.key, required this.caseData, required this.userRating});

  @override
  State<CaseDetailPage> createState() => _CaseDetailPageState();
}

class _CaseDetailPageState extends State<CaseDetailPage> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    int minRating = int.tryParse(widget.caseData['minRating'] ?? '0') ?? 0;
    int minLawyerRating = minRating;
    int minJudgeRating = minRating + 20;
    bool canEnterTrial = widget.userRating >= minLawyerRating;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.caseData['title']!, style: const TextStyle(color: Color(0xFF174AC9))),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rating: ${widget.userRating}',
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(widget.caseData['type'] ?? 'Unknown'),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    'Case Image Placeholder',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.caseData['title']!,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Overview: ${widget.caseData['description']?.split('\n').first ?? 'No overview'}\n'
                'Evidence: ${widget.caseData['description']?.split('\n')[1] ?? 'No evidence'}\n'
                'Details: ${widget.caseData['description']?.split('\n').last ?? 'No details'}',
                style: const TextStyle(color: Colors.black87, fontSize: 16),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Minimum Ratings:\n- Lawyer (Plaintiff/Defendant): $minLawyerRating\n- Judge: $minJudgeRating',
                style: const TextStyle(color: Colors.black87, fontSize: 16),
              ),
              const SizedBox(height: 16.0),
              if (canEnterTrial)
                Column(
                  children: [
                    if (widget.userRating >= minJudgeRating)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VirtualTrialRoom(mode: 'judge'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF174AC9)),
                        child: const Text('Enter Trial Room as Judge', style: TextStyle(color: Colors.white)),
                      ),
                    if (widget.userRating >= minLawyerRating && widget.userRating < minJudgeRating)
                      Column(
                        children: [
                          DropdownButton<String>(
                            value: selectedRole,
                            hint: const Text('Choose Role', style: TextStyle(color: Colors.black87)),
                            items: ['Plaintiff', 'Defendant']
                                .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRole = value;
                              });
                            },
                            dropdownColor: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: selectedRole != null
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const VirtualTrialRoom(mode: 'lawyer'),
                                      ),
                                    );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF174AC9)),
                            child: const Text('Enter Trial Room', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VirtualTrialRoom(mode: 'spectate'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFACD4FC)),
                child: const Text('Spectate', style: TextStyle(color: Colors.black87)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(String caseType) {
    switch (caseType) {
      case 'Criminal Cases':
        return Colors.blue[700]!;
      case 'Civil Cases':
        return Colors.orange[700]!;
      case 'Consumer Cases':
        return Colors.green[700]!;
      case 'Environmental/Public Interest':
        return Colors.brown[700]!;
      default:
        return Colors.grey[700]!;
    }
  }
}

class VirtualTrialRoom extends StatelessWidget {
  final String? mode;

  const VirtualTrialRoom({super.key, this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Trial Room', style: TextStyle(color: Color(0xFF174AC9))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          mode == 'spectate'
              ? 'Spectating Trial Room'
              : mode == 'judge'
                  ? 'Participating as Judge'
                  : 'Participating as Lawyer',
          style: const TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
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
        {
          'question': 'Which article guarantees equality before law?',
          'options': ['Article 14', 'Article 19', 'Article 21', 'Article 32'],
          'correctAnswer': 'Article 14'
        },
      ],
    },
  ];

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
                textStyle: const TextStyle(color: Color(0xFF174AC9), fontSize: 24),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: const Color(0xFFACD4FC),
              child: ListTile(
                title: DropdownButton<String>(
                  value: quizzes.length > 1 ? quizzes[0]['title'] : null,
                  hint: const Text('Select Quiz', style: TextStyle(color: Colors.black87)),
                  items: quizzes.map((quiz) {
                    return DropdownMenuItem<String>(
                      value: quiz['title'],
                      child: Text(quiz['title']!, style: const TextStyle(color: Colors.black87)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      currentQuizIndex = 0;
                      correctAnswers = 0;
                      selectedQuizAnswer = null;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (currentQuizIndex < quizzes[0]['questions'].length)
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Question ${currentQuizIndex + 1}/${quizzes[0]['questions'].length}',
                          style: const TextStyle(color: Color(0xFF174AC9), fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          quizzes[0]['questions'][currentQuizIndex]['question'],
                          style: const TextStyle(color: Colors.black87, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ...quizzes[0]['questions'][currentQuizIndex]['options'].map<Widget>((option) {
                          return RadioListTile<String>(
                            title: Text(option, style: const TextStyle(color: Colors.black87)),
                            value: option,
                            groupValue: selectedQuizAnswer,
                            onChanged: (value) {
                              setState(() {
                                selectedQuizAnswer = value;
                              });
                            },
                            activeColor: const Color(0xFF174AC9),
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
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFACD4FC)),
                                child: const Text('Previous', style: TextStyle(color: Colors.black87)),
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
                                              backgroundColor: Color(0xFF174AC9),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Wrong!'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                        if (currentQuizIndex < quizzes[0]['questions'].length - 1) {
                                          currentQuizIndex++;
                                          selectedQuizAnswer = null;
                                        }
                                      });
                                    },
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF174AC9)),
                              child: currentQuizIndex == quizzes[0]['questions'].length - 1
                                  ? const Text('Finish', style: TextStyle(color: Colors.white))
                                  : const Text('Next', style: TextStyle(color: Colors.white)),
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
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Quiz Completed!',
                        style: TextStyle(color: Color(0xFF174AC9), fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Score: $correctAnswers/${quizzes[0]['questions'].length}',
                        style: const TextStyle(color: Colors.black87, fontSize: 20),
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
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF174AC9)),
                        child: const Text('Restart Quiz', style: TextStyle(color: Colors.white)),
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

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showFullScoreboard = false;

  final List<FlSpot> _ratingSpots = [
    FlSpot(0, 2400),
    FlSpot(1, 2600),
    FlSpot(2, 2700),
    FlSpot(3, 2650),
    FlSpot(4, 2550),
    FlSpot(5, 2450),
    FlSpot(6, 2300),
    FlSpot(7, 2350),
    FlSpot(8, 2500),
    FlSpot(9, 2700),
    FlSpot(10, 2800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Color(0xFF174AC9))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: const Color(0xFFE6F3FF),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF174AC9),
                        child: Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@sreeshma',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Sreeshma P',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Subscription Model',
                style: TextStyle(color: Color(0xFF174AC9), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Card(
                color: const Color(0xFFACD4FC),
                child: ListTile(
                  title: const Text('Basic Plan', style: TextStyle(color: Colors.black87)),
                  subtitle: const Text('Free with limited features.', style: TextStyle(color: Colors.black87)),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF174AC9)),
                    child: const Text('Select', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Card(
                color: const Color(0xFFACD4FC),
                child: ListTile(
                  title: const Text('Premium Plan', style: TextStyle(color: Colors.black87)),
                  subtitle: const Text('₹499/month with full access.', style: TextStyle(color: Colors.black87)),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF174AC9)),
                    child: const Text('Subscribe', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Rating Growth',
                style: TextStyle(color: Color(0xFF174AC9), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 500,
                          verticalInterval: 1,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.grey.withOpacity(0.2),
                              strokeWidth: 1,
                            );
                          },
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: Colors.grey.withOpacity(0.2),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0: return const Text('Mar 2024', style: TextStyle(color: Colors.black87, fontSize: 10));
                                  case 3: return const Text('Jun 2024', style: TextStyle(color: Colors.black87, fontSize: 10));
                                  case 6: return const Text('Sep 2024', style: TextStyle(color: Colors.black87, fontSize: 10));
                                  case 9: return const Text('Dec 2024', style: TextStyle(color: Colors.black87, fontSize: 10));
                                  case 10: return const Text('Jan 2025', style: TextStyle(color: Colors.black87, fontSize: 10));
                                  default: return const Text('');
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 500,
                              getTitlesWidget: (value, meta) {
                                if (value % 500 == 0) {
                                  return Text(value.toInt().toString(), style: const TextStyle(color: Colors.black87, fontSize: 10));
                                }
                                return const Text('');
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        ),
                        minX: 0,
                        maxX: 10,
                        minY: 2000,
                        maxY: 3000,
                        lineBarsData: [
                          LineChartBarData(
                            spots: _ratingSpots,
                            isCurved: false,
                            color: const Color(0xFF174AC9),
                            barWidth: 2,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Scoreboard',
                style: TextStyle(color: Color(0xFF174AC9), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Card(
                color: _showFullScoreboard ? Colors.white : const Color(0xFFACD4FC),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _showFullScoreboard = !_showFullScoreboard;
                    });
                  },
                  child: _showFullScoreboard
                      ? Column(
                          children: [
                            _buildScoreEntry('You', '6441', 24197),
                            _buildScoreEntry('Player 2', '200', 2),
                            _buildScoreEntry('Player 3', '180', 3),
                            _buildScoreEntry('Player 4', '150', 4),
                            _buildScoreEntry('Player 5', '120', 5),
                          ],
                        )
                      : _buildScoreEntry('You', '6441', 24197),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreEntry(String name, String score, int rank) {
    return ListTile(
      leading: Text('$rank', style: const TextStyle(color: Colors.black87)),
      title: Text(name, style: const TextStyle(color: Colors.black87)),
      trailing: Text(score, style: const TextStyle(color: Colors.black87)),
    );
  }
}