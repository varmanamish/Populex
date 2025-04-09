import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
        primaryColor: const Color(0xFF0F1C2E),
        scaffoldBackgroundColor: const Color(0xFF0F1C2E),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Color(0xFFFFC107)),
          bodyMedium: TextStyle(color: Color(0xFFF5F6F5)),
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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    TrialRoomPage(),
    QuizPage(),
    ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 24, color: Color(0xFFF5F6F5)),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.gavel, size: 24, color: Color(0xFFF5F6F5)),
      label: 'Trial Room',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school, size: 24, color: Color(0xFFF5F6F5)),
      label: 'Quiz',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person, size: 24, color: Color(0xFFF5F6F5)),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1C2E),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: BottomNavigationBar(
          items: _navItems,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF00A86B),
          unselectedItemColor: const Color(0xFFF5F6F5),
          backgroundColor: const Color(0xFF0F1C2E),
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
            color: const Color(0xFF1E2A44),
            child: PageView(
              children: [
                Container(color: Colors.grey, child: const Center(child: Text('Carousel Item 1'))),
                Container(color: Colors.grey, child: const Center(child: Text('Carousel Item 2'))),
                Container(color: Colors.grey, child: const Center(child: Text('Carousel Item 3'))),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: ServicesCard(),
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
      color: const Color(0xFF4A6B6F),
      margin: const EdgeInsets.all(16.0),
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
          backgroundColor: const Color(0xFF00A86B),
          child: Icon(icon, size: 30, color: const Color(0xFFF5F6F5)),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 12),
        ),
      ],
    );
  }
}

class TrialRoomPage extends StatefulWidget {
  const TrialRoomPage({super.key});

  @override
  _TrialRoomPageState createState() => _TrialRoomPageState();
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
    _selectedCategory = cases.keys.first; // Ensure a valid initial category
  }

  @override
  Widget build(BuildContext context) {
    final filteredCases = cases[_selectedCategory] ?? [];
    print('Filtered cases length: ${filteredCases.length}'); // Debug print

    if (filteredCases.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Trial Room', style: TextStyle(color: Color(0xFFFFC107))),
          backgroundColor: const Color(0xFF0F1C2E),
        ),
        body: const Center(
          child: Text('No cases available', style: TextStyle(color: Color(0xFFF5F6F5))),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial Room', style: TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF0F1C2E),
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
              style: TextStyle(color: Color(0xFFF5F6F5), fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCases.length,
              itemBuilder: (context, index) {
                final caseData = filteredCases[index];
                return GestureDetector(
                  onTap: () {
                    try {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CaseDetailPage(
                            caseData: caseData,
                            userRating: 65, // Replace with dynamic user rating
                          ),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error navigating: $e')),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color(0xFF4A6B6F),
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
                                color: Color(0xFFF5F6F5),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              caseData['description']!.split('\n').first,
                              style: const TextStyle(
                                color: Color(0xFFF5F6F5),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Min Rating: ${caseData['minRating']}',
                              style: const TextStyle(
                                color: Color(0xFFF5F6F5),
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
            print('Selected category: $_selectedCategory');
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF00A86B) : const Color(0xFF4A6B6F),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        child: Text(label, style: const TextStyle(color: Color(0xFFF5F6F5))),
      ),
    );
  }
}

class CaseDetailPage extends StatefulWidget {
  final Map<String, String> caseData;
  final int userRating;

  const CaseDetailPage({super.key, required this.caseData, required this.userRating});

  @override
  _CaseDetailPageState createState() => _CaseDetailPageState();
}

class _CaseDetailPageState extends State<CaseDetailPage> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    int minRating = int.tryParse(widget.caseData['minRating'] ?? '0') ?? 0;
    int minLawyerRating = minRating;
    int minJudgeRating = minRating + 20; // Higher rating for judge
    bool canEnterTrial = widget.userRating >= minLawyerRating;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.caseData['title']!, style: const TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rating: ${widget.userRating}',
              style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 16),
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
              // Case Image Placeholder
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
              // Case Heading
              Text(
                widget.caseData['title']!,
                style: const TextStyle(
                  color: Color(0xFFF5F6F5),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              // Case Description
              Text(
                'Overview: ${widget.caseData['description']?.split('\n').first ?? 'No overview'}\n'
                'Evidence: ${widget.caseData['description']?.split('\n')[1] ?? 'No evidence'}\n'
                'Details: ${widget.caseData['description']?.split('\n').last ?? 'No details'}',
                style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 16),
              ),
              const SizedBox(height: 16.0),
              // Minimum Ratings
              Text(
                'Minimum Ratings:\n- Lawyer (Plaintiff/Defendant): $minLawyerRating\n- Judge: $minJudgeRating',
                style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 16),
              ),
              const SizedBox(height: 16.0),
              // Action Buttons
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
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00A86B)),
                        child: const Text('Enter Trial Room as Judge', style: TextStyle(color: Color(0xFFF5F6F5))),
                      ),
                    if (widget.userRating >= minLawyerRating && widget.userRating < minJudgeRating)
                      Column(
                        children: [
                          DropdownButton<String>(
                            value: selectedRole,
                            hint: const Text('Choose Role', style: TextStyle(color: Color(0xFFF5F6F5))),
                            items: ['Plaintiff', 'Defendant']
                                .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRole = value;
                              });
                            },
                            style: const TextStyle(color: Color(0xFFF5F6F5)),
                            dropdownColor: const Color(0xFF1E2A44),
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
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00A86B)),
                            child: const Text('Enter Trial Room', style: TextStyle(color: Color(0xFFF5F6F5))),
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
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A6B6F)),
                child: const Text('Spectate', style: TextStyle(color: Color(0xFFF5F6F5))),
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
        title: const Text('Virtual Trial Room', style: TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: Center(
        child: Text(
          mode == 'spectate'
              ? 'Spectating Trial Room'
              : mode == 'judge'
                  ? 'Participating as Judge'
                  : 'Participating as Lawyer',
          style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 20),
        ),
      ),
    );
  }
}

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
        {
          'question': 'Which article guarantees equality before law?',
          'options': ['Article 14', 'Article 19', 'Article 21', 'Article 32'],
          'correctAnswer': 'Article 14'
        },
        // ... (rest of the questions remain unchanged)
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Subscription Model',
              style: TextStyle(color: Color(0xFFF5F6F5), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
              color: const Color(0xFF4A6B6F),
              child: ListTile(
                title: const Text('Basic Plan', style: TextStyle(color: Color(0xFFF5F6F5))),
                subtitle: const Text('Free with limited features.', style: TextStyle(color: Color(0xFFF5F6F5))),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00A86B)),
                  child: const Text('Select', style: TextStyle(color: Color(0xFFF5F6F5))),
                ),
              ),
            ),
            Card(
              color: const Color(0xFF4A6B6F),
              child: ListTile(
                title: const Text('Premium Plan', style: TextStyle(color: Color(0xFFF5F6F5))),
                subtitle: const Text('₹499/month with full access.', style: TextStyle(color: Color(0xFFF5F6F5))),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00A86B)),
                  child: const Text('Subscribe', style: TextStyle(color: Color(0xFFF5F6F5))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Scoreboard',
              style: TextStyle(color: Color(0xFFF5F6F5), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildScoreEntry('You', '250', 1),
                  _buildScoreEntry('Player 2', '200', 2),
                  _buildScoreEntry('Player 3', '180', 3),
                  _buildScoreEntry('Player 4', '150', 4),
                  _buildScoreEntry('Player 5', '120', 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreEntry(String name, String score, int rank) {
    return Card(
      color: const Color(0xFF1E2A44),
      child: ListTile(
        leading: Text('$rank', style: const TextStyle(color: Color(0xFFF5F6F5))),
        title: Text(name, style: const TextStyle(color: Color(0xFFF5F6F5))),
        trailing: Text(score, style: const TextStyle(color: Color(0xFFF5F6F5))),
      ),
    );
  }
}