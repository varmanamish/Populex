import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int? _expandedIndex;

  final List<Course> _courses = [
    Course(
      title: 'Constitutional Law Fundamentals',
      description: 'Master the Indian Constitution with case studies',
      instructor: 'Prof. R. Sharma',
      duration: '8 Weeks',
      pdfs: [
        CoursePdf(
          title: 'Indian Constitution Full Text',
          url: 'https://legislative.gov.in/sites/default/files/COI_1.pdf',
        ),
        CoursePdf(
          title: 'Landmark Judgments Analysis',
          url:
              'https://www.supremecourt.gov.in/pdf/LU/ALL%20ABOUT%20BASIC%20STRUCTURE%20OF%20CONSTITUTION%20OF%20INDIA.pdf',
        ),
      ],
    ),
    Course(
      title: 'Criminal Procedure Code',
      description: 'Complete guide to CrPC with practical examples',
      instructor: 'Adv. A. Kapoor',
      duration: '6 Weeks',
      pdfs: [
        CoursePdf(
          title: 'CrPC Handbook 2023',
          url:
              'https://www.indiacode.nic.in/bitstream/123456789/1977/1/A1974-02.pdf',
        ),
      ],
    ),
    Course(
      title: 'Contract Law Essentials',
      description: 'Learn contract formation and enforcement',
      instructor: 'Prof. S. Patel',
      duration: '4 Weeks',
      pdfs: [
        CoursePdf(
          title: 'Indian Contract Act',
          url:
              'https://www.indiacode.nic.in/bitstream/123456789/2187/1/A1872-09.pdf',
        ),
      ],
    ),
  ];

  Future<void> _launchPdf(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'POPULEX',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Law Courses',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Available Courses',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF174AC9),
            ),
          ),
          const SizedBox(height: 16),
          ..._courses.asMap().entries.map((entry) {
            final index = entry.key;
            final course = entry.value;
            return Card(
              child: ExpansionTile(
                key: Key(index.toString()),
                initiallyExpanded: index == _expandedIndex,
                onExpansionChanged: (expanded) {
                  setState(() {
                    _expandedIndex = expanded ? index : null;
                  });
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECF3FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.school, color: Color(0xFF174AC9)),
                ),
                title: Text(
                  course.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.description),
                    const SizedBox(height: 4),
                    Text(
                      '${course.instructor} • ${course.duration}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                children: [
                  if (course.pdfs.isNotEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Course Materials:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF174AC9),
                        ),
                      ),
                    ),
                    ...course.pdfs.map((pdf) => ListTile(
                          leading: const Icon(Icons.picture_as_pdf,
                              color: Colors.red),
                          title: Text(pdf.title),
                          onTap: () => _launchPdf(pdf.url),
                        )),
                  ],
                  if (course.pdfs.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('No materials available yet'),
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      color: const Color(0xFFECF3FF),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.summarize, 'Summarizer'),
            _buildNavItem(Icons.gavel, 'Trial Room'),
            _buildNavItem(Icons.home, 'Home'),
            _buildNavItem(Icons.people, 'Community'),
            _buildNavItem(Icons.person, 'Profile'),
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
}

class Course {
  final String title;
  final String description;
  final String instructor;
  final String duration;
  final List<CoursePdf> pdfs;

  Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.duration,
    required this.pdfs,
  });
}

class CoursePdf {
  final String title;
  final String url;

  CoursePdf({
    required this.title,
    required this.url,
  });
}
