import 'package:flutter/material.dart';

class ScoreEntry extends StatelessWidget {
  final String name;
  final String score;
  final int rank;

  const ScoreEntry({
    super.key,
    required this.name,
    required this.score,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('$rank', style: const TextStyle(color: Color(0xFFF5F6F5))),
      title: Text(name, style: const TextStyle(color: Color(0xFFF5F6F5))),
      trailing: Text(score, style: const TextStyle(color: Color(0xFFF5F6F5))),
    );
  }
}
