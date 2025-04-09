import 'package:flutter/material.dart';

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
