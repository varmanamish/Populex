import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: const Color(0xFF7F8C9A),
      onTap: widget.onTap,
      selectedIconTheme: const IconThemeData(
        color: Color(0xFF00A86B),
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Color(0xFF7F8C9A),
        size: 24,
      ),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      showUnselectedLabels: true,
      elevation: 8,
      iconSize: 0, // Set to 0 to use custom builder
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: _buildAnimatedItems(),
    );
  }

  List<BottomNavigationBarItem> _buildAnimatedItems() {
    const List<IconData> icons = [
      Icons.description, // Documents
      Icons.gavel, // Trial Room
      Icons.home, // Home
      Icons.people, // Quiz
      Icons.person, // Profile
    ];

    const List<String> labels = [
      'Documents',
      'Trial Room',
      'Home',
      'Community',
      'Profile',
    ];

    return List.generate(5, (index) {
      return BottomNavigationBarItem(
        icon: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(widget.currentIndex == index ? 8.0 : 0.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.currentIndex == index
                ? const Color(0xFF2158E0)
                : Colors.transparent,
          ),
          child: Icon(
            icons[index],
            size: widget.currentIndex == index ? 30 : 24,
            color: widget.currentIndex == index
                ? const Color(0xFFD5EAFF)
                : const Color(0xFF7F8C9A),
          ),
        ),
        label: labels[index],
      );
    });
  }
}
