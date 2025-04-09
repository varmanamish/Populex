import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CoursesQuizzesPage extends StatefulWidget {
  const CoursesQuizzesPage({super.key});

  @override
  _CoursesQuizzesPageState createState() => _CoursesQuizzesPageState();
}

class _CoursesQuizzesPageState extends State<CoursesQuizzesPage> {
  // Sample data for courses with descriptions and files
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Indian Constitution & Fundamental Rights (Beginner)',
      'description':
          'An introductory course on the Indian Constitution, covering fundamental rights, duties, and key articles for beginners.',
      'files': [
        'File 1: Article 14 - Equality Before Law.pdf',
        'File 2: Article 19 - Freedom of Speech.pdf',
        'File 3: Article 21 - Right to Life.pdf',
        'File 4: Fundamental Duties Overview.pdf',
        'File 5: Preamble Explained.pdf',
        'File 6: Directive Principles.pdf',
        'File 7: Case Study - Maneka Gandhi.pdf',
        'File 8: Rights of Minorities.pdf',
        'File 9: Constitutional Amendments.pdf',
        'File 10: Quiz on Fundamental Rights.pdf',
      ],
    },
    {
      'title': 'Criminal & Civil Law Basics (Intermediate)',
      'description':
          'Explore the foundations of criminal and civil law, including IPC, CrPC, and key legal principles for intermediate learners.',
      'files': [
        'File 1: IPC Section 300 - Murder.pdf',
        'File 2: CrPC Section 154 - FIR.pdf',
        'File 3: Civil Procedure Code Overview.pdf',
        'File 4: IPC Section 379 - Theft.pdf',
        'File 5: CrPC Section 164 - Confession.pdf',
        'File 6: Tort Law Basics.pdf',
        'File 7: Contract Act 1872.pdf',
        'File 8: Bail Provisions.pdf',
        'File 9: Evidence Act Summary.pdf',
        'File 10: Case Law Analysis.pdf',
      ],
    },
    {
      'title': 'Advanced Legal Drafting & Advocacy (Advanced)',
      'description':
          'Master advanced techniques in legal drafting, pleadings, and advocacy skills for experienced law professionals.',
      'files': [
        'File 1: Drafting Pleadings Guide.pdf',
        'File 2: Advocacy Techniques.pdf',
        'File 3: Cross-Examination Strategies.pdf',
        'File 4: Writing Legal Opinions.pdf',
        'File 5: Appellate Briefs.pdf',
        'File 6: Contract Drafting Tips.pdf',
        'File 7: Courtroom Etiquette.pdf',
        'File 8: Case Preparation Checklist.pdf',
        'File 9: Oral Argument Skills.pdf',
        'File 10: Mock Trial Scripts.pdf',
      ],
    },
    {
      'title': 'Moot Court Preparation (Advanced)',
      'description':
          'Prepare for moot court competitions with strategies for research, argumentation, and courtroom presentation.',
      'files': [
        'File 1: Moot Problem 2023.pdf',
        'File 2: Research Methodology.pdf',
        'File 3: Argument Structure Guide.pdf',
        'File 4: Citation Standards.pdf',
        'File 5: Moot Court Rules.pdf',
        'File 6: Sample Memorial.pdf',
        'File 7: Judge’s Perspective.pdf',
        'File 8: Time Management Tips.pdf',
        'File 9: Rebuttal Techniques.pdf',
        'File 10: Past Moot Winners.pdf',
      ],
    },
    {
      'title': 'Legal Research & Writing (All levels)',
      'description':
          'Develop skills in legal research, citation, and writing across all levels, with practical exercises.',
      'files': [
        'File 1: Research Tools Guide.pdf',
        'File 2: Bluebook Citation.pdf',
        'File 3: Legal Writing Basics.pdf',
        'File 4: Case Law Research.pdf',
        'File 5: Statutory Interpretation.pdf',
        'File 6: Writing Briefs.pdf',
        'File 7: Academic Writing Tips.pdf',
        'File 8: Plagiarism Rules.pdf',
        'File 9: Research Paper Template.pdf',
        'File 10: Citation Exercises.pdf',
      ],
    },
    {
      'title': 'Recent Amendments & Evolving Laws (Ongoing updates)',
      'description':
          'Stay updated on recent legal amendments, landmark judgments, and evolving laws in India.',
      'files': [
        'File 1: GST Amendment 2023.pdf',
        'File 2: Citizenship Act Update.pdf',
        'File 3: Labor Code 2022.pdf',
        'File 4: Data Protection Bill.pdf',
        'File 5: Farm Laws Repeal.pdf',
        'File 6: Criminal Justice Reforms.pdf',
        'File 7: Environmental Laws.pdf',
        'File 8: Judicial Appointments.pdf',
        'File 9: Marriage Laws Update.pdf',
        'File 10: Landmark Judgments 2023.pdf',
      ],
    },
  ];

  // Sample data for quizzes with 10 questions each
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
        {
          'question': 'What does IPC stand for?',
          'options': [
            'Indian Penal Code',
            'Indian Police Code',
            'International Penal Code',
            'Indian Procedure Code'
          ],
          'correctAnswer': 'Indian Penal Code'
        },
        {
          'question': 'Which act governs contracts in India?',
          'options': [
            'Contract Act 1872',
            'Sale of Goods Act',
            'Partnership Act',
            'Negotiable Instruments Act'
          ],
          'correctAnswer': 'Contract Act 1872'
        },
        {
          'question': 'What is the maximum term of the Lok Sabha?',
          'options': ['4 years', '5 years', '6 years', '7 years'],
          'correctAnswer': '5 years'
        },
        {
          'question': 'Which schedule contains the Union List?',
          'options': ['Seventh', 'Eighth', 'Ninth', 'Tenth'],
          'correctAnswer': 'Seventh'
        },
        {
          'question': 'What is the age of retirement for a High Court judge?',
          'options': ['62', '65', '68', '70'],
          'correctAnswer': '62'
        },
        {
          'question': 'Which article deals with the Right to Education?',
          'options': ['Article 21A', 'Article 19', 'Article 25', 'Article 32'],
          'correctAnswer': 'Article 21A'
        },
        {
          'question': 'What is the full form of CrPC?',
          'options': [
            'Criminal Procedure Code',
            'Civil Procedure Code',
            'Criminal Penal Code',
            'Code of Criminal Practice'
          ],
          'correctAnswer': 'Criminal Procedure Code'
        },
        {
          'question': 'Which body interprets the Constitution?',
          'options': ['Parliament', 'Supreme Court', 'President', 'Cabinet'],
          'correctAnswer': 'Supreme Court'
        },
      ],
    },
    {
      'title': 'Landmark Judgments',
      'questions': [
        {
          'question': 'Which case established the "Basic Structure" doctrine?',
          'options': [
            'Maneka Gandhi v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Minerva Mills v. Union of India',
            'Golaknath v. State of Punjab'
          ],
          'correctAnswer': 'Kesavananda Bharati v. State of Kerala'
        },
        {
          'question': 'Which case expanded Article 21 to include personal liberty?',
          'options': [
            'Maneka Gandhi v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'ADM Jabalpur v. Shivkant Shukla',
            'Indira Gandhi v. Raj Narain'
          ],
          'correctAnswer': 'Maneka Gandhi v. Union of India'
        },
        {
          'question': 'Which case upheld the right to privacy?',
          'options': [
            'Puttaswamy v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Vishaka v. State of Rajasthan',
            'Golaknath v. State of Punjab'
          ],
          'correctAnswer': 'Puttaswamy v. Union of India'
        },
        {
          'question': 'Which case dealt with sexual harassment at workplace?',
          'options': [
            'Vishaka v. State of Rajasthan',
            'Kesavananda Bharati v. State of Kerala',
            'Maneka Gandhi v. Union of India',
            'Indira Gandhi v. Raj Narain'
          ],
          'correctAnswer': 'Vishaka v. State of Rajasthan'
        },
        {
          'question': 'Which case invalidated the NJAC Act?',
          'options': [
            'Supreme Court Advocates-on-Record Association v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Minerva Mills v. Union of India',
            'Golaknath v. State of Punjab'
          ],
          'correctAnswer': 'Supreme Court Advocates-on-Record Association v. Union of India'
        },
        {
          'question': 'Which case upheld the right to live with dignity?',
          'options': [
            'Francis Coralie v. Union Territory of Delhi',
            'Kesavananda Bharati v. State of Kerala',
            'Maneka Gandhi v. Union of India',
            'ADM Jabalpur v. Shivkant Shukla'
          ],
          'correctAnswer': 'Francis Coralie v. Union Territory of Delhi'
        },
        {
          'question': 'Which case dealt with the dissolution of Bihar Assembly?',
          'options': [
            'Rameshwar Prasad v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Minerva Mills v. Union of India',
            'Golaknath v. State of Punjab'
          ],
          'correctAnswer': 'Rameshwar Prasad v. Union of India'
        },
        {
          'question': 'Which case established public interest litigation?',
          'options': [
            'SP Gupta v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Maneka Gandhi v. Union of India',
            'Indira Gandhi v. Raj Narain'
          ],
          'correctAnswer': 'SP Gupta v. Union of India'
        },
        {
          'question': 'Which case struck down Section 66A of IT Act?',
          'options': [
            'Shreya Singhal v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Minerva Mills v. Union of India',
            'Golaknath v. State of Punjab'
          ],
          'correctAnswer': 'Shreya Singhal v. Union of India'
        },
        {
          'question': 'Which case dealt with the right to property?',
          'options': [
            'Golaknath v. State of Punjab',
            'Kesavananda Bharati v. State of Kerala',
            'Maneka Gandhi v. Union of India',
            'Minerva Mills v. Union of India'
          ],
          'correctAnswer': 'Golaknath v. State of Punjab'
        },
      ],
    },
    {
      'title': 'Current Legal Affairs',
      'questions': [
        {
          'question': 'Which amendment introduced the Goods and Services Tax (GST)?',
          'options': ['101st Amendment', '99th Amendment', '100th Amendment', '102nd Amendment'],
          'correctAnswer': '101st Amendment'
        },
        {
          'question': 'Which law repealed the farm laws in 2021?',
          'options': ['Farm Laws Repeal Act', 'Agriculture Act', 'Land Reform Act', 'Farm Bill'],
          'correctAnswer': 'Farm Laws Repeal Act'
        },
        {
          'question': 'Which act regulates data protection in India (proposed)?',
          'options': [
            'Personal Data Protection Bill',
            'IT Act 2000',
            'Digital Security Act',
            'Cyber Law Act'
          ],
          'correctAnswer': 'Personal Data Protection Bill'
        },
        {
          'question': 'Which amendment dealt with the NJAC?',
          'options': ['99th Amendment', '100th Amendment', '101st Amendment', '98th Amendment'],
          'correctAnswer': '99th Amendment'
        },
        {
          'question': 'Which law consolidated labor codes in 2020?',
          'options': [
            'Code on Wages',
            'Code on Social Security',
            'Code on Occupational Safety',
            'All of the above'
          ],
          'correctAnswer': 'All of the above'
        },
        {
          'question': 'Which case involved the abrogation of Article 370?',
          'options': [
            'Article 370 Case',
            'Kesavananda Bharati v. State of Kerala',
            'Maneka Gandhi v. Union of India',
            'Indira Gandhi v. Raj Narain'
          ],
          'correctAnswer': 'Article 370 Case'
        },
        {
          'question': 'Which act amended the citizenship laws in 2019?',
          'options': [
            'Citizenship Amendment Act',
            'Nationality Act',
            'Immigration Act',
            'Residency Act'
          ],
          'correctAnswer': 'Citizenship Amendment Act'
        },
        {
          'question': 'Which law governs environmental protection in India?',
          'options': [
            'Environment Protection Act 1986',
            'Wildlife Protection Act',
            'Forest Conservation Act',
            'All of the above'
          ],
          'correctAnswer': 'All of the above'
        },
        {
          'question': 'Which amendment increased reservation for OBCs?',
          'options': ['103rd Amendment', '102nd Amendment', '101st Amendment', '100th Amendment'],
          'correctAnswer': '103rd Amendment'
        },
        {
          'question': 'Which case dealt with marital rape exception?',
          'options': [
            'Independent Thought v. Union of India',
            'Kesavananda Bharati v. State of Kerala',
            'Maneka Gandhi v. Union of India',
            'Shreya Singhal v. Union of India'
          ],
          'correctAnswer': 'Independent Thought v. Union of India'
        },
      ],
    },
    {
      'title': 'Legal Ethics & Court Etiquette',
      'questions': [
        {
          'question': 'How should a lawyer address a judge in court?',
          'options': ['Sir/Madam', 'Your Honor', 'Mr./Ms. Judge', 'Counsel'],
          'correctAnswer': 'Your Honor'
        },
        {
          'question': 'What is the appropriate courtroom dress code?',
          'options': [
            'Casual attire',
            'Black coat and gown',
            'Traditional attire',
            'Business suit'
          ],
          'correctAnswer': 'Black coat and gown'
        },
        {
          'question': 'When should a lawyer stand in court?',
          'options': [
            'While addressing the judge',
            'Only when called',
            'During breaks',
            'Never'
          ],
          'correctAnswer': 'While addressing the judge'
        },
        {
          'question': 'What is a key ethical duty of a lawyer?',
          'options': [
            'Maximize personal gain',
            'Maintain client confidentiality',
            'Avoid court appearances',
            'Charge high fees'
          ],
          'correctAnswer': 'Maintain client confidentiality'
        },
        {
          'question': 'What should a lawyer avoid in court?',
          'options': [
            'Respectful language',
            'Interruptions',
            'Prepared arguments',
            'Timely submissions'
          ],
          'correctAnswer': 'Interruptions'
        },
        {
          'question': 'What is the role of a lawyer in mediation?',
          'options': [
            'Act as a judge',
            'Facilitate settlement',
            'Enforce decisions',
            'Ignore the process'
          ],
          'correctAnswer': 'Facilitate settlement'
        },
        {
          'question': 'What is the penalty for contempt of court?',
          'options': ['Fine', 'Imprisonment', 'Both', 'Warning'],
          'correctAnswer': 'Both'
        },
        {
          'question': 'Which behavior is unethical for a lawyer?',
          'options': [
            'Honesty',
            'Conflict of interest',
            'Diligence',
            'Professionalism'
          ],
          'correctAnswer': 'Conflict of interest'
        },
        {
          'question': 'What is the purpose of a bar council?',
          'options': [
            'Regulate legal practice',
            'Provide loans',
            'Sell legal books',
            'Hire judges'
          ],
          'correctAnswer': 'Regulate legal practice'
        },
        {
          'question': 'How should a lawyer handle a lost case?',
          'options': [
            'Blame the client',
            'Appeal if valid',
            'Quit the profession',
            'Ignore the outcome'
          ],
          'correctAnswer': 'Appeal if valid'
        },
      ],
    },
    {
      'title': 'Case Analysis',
      'questions': [
        {
          'question': 'In a theft case, which IPC section applies?',
          'options': [
            'Section 302 (Murder)',
            'Section 379 (Theft)',
            'Section 420 (Cheating)',
            'Section 498A (Cruelty)'
          ],
          'correctAnswer': 'Section 379 (Theft)'
        },
        {
          'question': 'Which section deals with murder in IPC?',
          'options': [
            'Section 302',
            'Section 379',
            'Section 420',
            'Section 498A'
          ],
          'correctAnswer': 'Section 302'
        },
        {
          'question': 'Which law applies to dowry harassment?',
          'options': [
            'Section 498A IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 302 IPC'
          ],
          'correctAnswer': 'Section 498A IPC'
        },
        {
          'question': 'What applies to a cheating case?',
          'options': [
            'Section 302 IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 498A IPC'
          ],
          'correctAnswer': 'Section 420 IPC'
        },
        {
          'question': 'Which section governs rape under IPC?',
          'options': [
            'Section 376',
            'Section 379',
            'Section 420',
            'Section 498A'
          ],
          'correctAnswer': 'Section 376'
        },
        {
          'question': 'What law applies to a robbery case?',
          'options': [
            'Section 390 IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 498A IPC'
          ],
          'correctAnswer': 'Section 390 IPC'
        },
        {
          'question': 'Which section deals with extortion?',
          'options': [
            'Section 383 IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 498A IPC'
          ],
          'correctAnswer': 'Section 383 IPC'
        },
        {
          'question': 'What applies to criminal breach of trust?',
          'options': [
            'Section 405 IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 498A IPC'
          ],
          'correctAnswer': 'Section 405 IPC'
        },
        {
          'question': 'Which section governs kidnapping?',
          'options': [
            'Section 359 IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 498A IPC'
          ],
          'correctAnswer': 'Section 359 IPC'
        },
        {
          'question': 'What law applies to forgery?',
          'options': [
            'Section 463 IPC',
            'Section 379 IPC',
            'Section 420 IPC',
            'Section 498A IPC'
          ],
          'correctAnswer': 'Section 463 IPC'
        },
      ],
    },
  ];

  String lastQuizRating = 'N/A'; // Track last quiz rating
  int userPoints = 250; // User score
  String? selectedQuizAnswer; // Track selected MCQ answer
  int currentQuizIndex = 0; // Track current quiz question index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Learn & Test',
                textStyle: const TextStyle(
                  color: Color(0xFFFFC107), // Radiant Gold
                  fontSize: 24,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        backgroundColor: const Color(0xFF0F1C2E), // Deep Space Blue
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Points: $userPoints',
              style: const TextStyle(
                color: Color(0xFF00A86B), // Vivid Emerald
                fontSize: 18,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Accuracy: $lastQuizRating',
            style: const TextStyle(
              color: Color(0xFFF5F6F5), // Frost White
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Courses',
                    style: TextStyle(
                      color: Color(0xFFFFC107), // Radiant Gold
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...courses.map((course) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  color: const Color(0xFF4A6B6F), // Steel Teal
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      course['title']!,
                      style: const TextStyle(
                        color: Color(0xFFF5F6F5), // Frost White
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      _showCourseFilesDialog(context, course);
                    },
                  ),
                ),
              )).toList(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quizzes',
                    style: TextStyle(
                      color: Color(0xFFFFC107), // Radiant Gold
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  return AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      color: const Color(0xFF4A6B6F), // Steel Teal
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          currentQuizIndex = 0; // Reset to first question
                          _showQuizDialog(context, quizzes[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                quizzes[index]['title']!,
                                style: const TextStyle(
                                  color: Color(0xFFF5F6F5), // Frost White
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Last: $lastQuizRating',
                                style: const TextStyle(
                                  color: Color(0xFFF5F6F5), // Frost White
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCourseFilesDialog(BuildContext context, Map<String, dynamic> course) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2A44), // Midnight Mist
        title: Text(
          course['title']!,
          style: const TextStyle(color: Color(0xFFFFC107)), // Radiant Gold
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                course['description']!,
                style: const TextStyle(color: Color(0xFFF5F6F5)), // Frost White
              ),
              const SizedBox(height: 10),
              const Text(
                'Available Files:',
                style: TextStyle(
                  color: Color(0xFFFFC107), // Radiant Gold
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              ...course['files'].map<Widget>((file) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  file,
                  style: const TextStyle(color: Color(0xFFF5F6F5)), // Frost White
                ),
              )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFF00A86B)), // Vivid Emerald
            ),
          ),
        ],
      ),
    );
  }

  void _showQuizDialog(BuildContext context, Map<String, dynamic> quiz) {
    String userAnswer = '';
    int questionIndex = currentQuizIndex;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2A44), // Midnight Mist
        title: Text(
          '${quiz['title']} - Question ${questionIndex + 1}/10',
          style: const TextStyle(color: Color(0xFFFFC107)), // Radiant Gold
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            final currentQuestion = quiz['questions'][questionIndex];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currentQuestion['question'],
                  style: const TextStyle(color: Color(0xFFF5F6F5)), // Frost White
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ...currentQuestion['options'].map<Widget>((option) => RadioListTile<String>(
                      title: Text(
                        option,
                        style: const TextStyle(color: Color(0xFFF5F6F5)), // Frost White
                      ),
                      value: option,
                      groupValue: userAnswer,
                      onChanged: (value) {
                        setState(() {
                          userAnswer = value!;
                        });
                      },
                      activeColor: Color(0xFF00A86B), // Vivid Emerald
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (questionIndex > 0)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            questionIndex--;
                            userAnswer = '';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A6B6F), // Steel Teal
                        ),
                        child: const Text('Previous'),
                      ),
                    if (questionIndex < 9)
                      ElevatedButton(
                        onPressed: userAnswer.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  lastQuizRating = (userAnswer == currentQuestion['correctAnswer'])
                                      ? '100%'
                                      : '0%';
                                  if (lastQuizRating == '100%') {
                                    userPoints += 10; // 10 points per correct answer
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Correct! +10 points!'),
                                        backgroundColor: Color(0xFF00A86B), // Vivid Emerald
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Wrong! Try again.'),
                                        backgroundColor: Color(0xFFD32F2F), // Deep Red
                                      ),
                                    );
                                  }
                                  questionIndex++;
                                  userAnswer = '';
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A6B6F), // Steel Teal
                        ),
                        child: const Text('Next'),
                      ),
                    if (questionIndex == 9)
                      ElevatedButton(
                        onPressed: userAnswer.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  lastQuizRating = (userAnswer == currentQuestion['correctAnswer'])
                                      ? '100%'
                                      : '0%';
                                  if (lastQuizRating == '100%') {
                                    userPoints += 10; // 10 points per correct answer
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Correct! +10 points! Quiz Complete!'),
                                        backgroundColor: Color(0xFF00A86B), // Vivid Emerald
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Wrong! Quiz Complete.'),
                                        backgroundColor: Color(0xFFD32F2F), // Deep Red
                                      ),
                                    );
                                  }
                                  Navigator.pop(context);
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A6B6F), // Steel Teal
                        ),
                        child: const Text('Submit'),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}