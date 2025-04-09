import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F1C2E),
      child: const Center(
        child: Text(
          'Document Summarizer',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
