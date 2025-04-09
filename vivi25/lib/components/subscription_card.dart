import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF4A6B6F),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Color(0xFFF5F6F5))),
        subtitle:
            Text(subtitle, style: const TextStyle(color: Color(0xFFF5F6F5))),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A86B)),
          child: Text(buttonText,
              style: const TextStyle(color: Color(0xFFF5F6F5))),
        ),
      ),
    );
  }
}
