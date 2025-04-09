import 'package:flutter/material.dart';

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