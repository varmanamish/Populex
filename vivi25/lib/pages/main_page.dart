import 'package:flutter/material.dart';
import 'package:vivi25/components/bottom_nav_bar.dart';
import 'package:vivi25/pages/community/community_page.dart';
import 'package:vivi25/pages/documents_page.dart';
import 'package:vivi25/pages/home_page.dart';
import 'package:vivi25/pages/legal_doc_assist_screen.dart';
import 'trial_room_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2; // Default to Home (center item)

  // Define all your pages here
  final List<Widget> _pages = [
    LegalDocAssistantScreen(),
    const TrialRoomPage(),
    const HomePage(),
    CommunityPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1C2E),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
