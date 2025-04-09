import 'package:flutter/material.dart';

class CaseCard extends StatelessWidget {
  final Map<String, String> caseData;
  final VoidCallback onTap;

  const CaseCard({super.key, required this.caseData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
  }
}
