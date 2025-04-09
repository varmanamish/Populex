import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            color: const Color(0xFF1E2A44),
            child: PageView(
              children: [
                Container(
                    color: Colors.grey,
                    child: const Center(child: Text('Legal Updates'))),
                Container(
                    color: Colors.grey,
                    child: const Center(child: Text('Case Studies'))),
                Container(
                    color: Colors.grey,
                    child: const Center(child: Text('News'))),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: const Color(0xFF0F1C2E),
            child: const Center(
              child: Text('Quick Access Tools'),
            ),
          ),
        ),
      ],
    );
  }
}
