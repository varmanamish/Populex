import 'package:flutter/material.dart';
import 'package:vivi25/pages/courses_page.dart';
import 'package:vivi25/pages/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POPULEX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF174AC9),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF174AC9),
          secondary: const Color(0xFFAD3AFF),
          surface: const Color(0xFFECF3FF),
          background: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF174AC9),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'POPULEX',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Holder (40% of screen)
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: const Color(0xFFECF3FF),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/600x400?text=POPULEX'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Cards Column
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildFeatureCard(
                    icon: Icons.school,
                    title: 'Courses',
                    subtitle: 'Explore our legal courses',
                    color: const Color(0xFFAD3AFF),
                    onPressed: () {
                      // Navigation example
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesPage()),
                      );

                      // Alternatively:
                      // context.push('/upload'); // If using go_router
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.quiz,
                    title: 'Quizzes',
                    subtitle: 'Test your legal knowledge',
                    color: const Color(0xFF174AC9),
                    onPressed: () {
                      // Navigation example
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );

                      // Alternatively:
                      // context.push('/upload'); // If using go_router
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.cases,
                    title: 'Previous Cases',
                    subtitle: 'Study landmark judgments',
                    color: const Color(0xFF34A853),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onPressed, // Add this parameter
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed, // Use the onPressed callback here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isActive
                ? const Color(0xFF174AC9)
                : const Color(0xFF174AC9).withOpacity(0.6),
            size: 24,
          ),
          onPressed: () {},
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isActive
                ? const Color(0xFF174AC9)
                : const Color(0xFF174AC9).withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
