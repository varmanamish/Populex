import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CaseLibraryPage extends StatefulWidget {
  const CaseLibraryPage({super.key});

  @override
  _CaseLibraryPageState createState() => _CaseLibraryPageState();
}

class _CaseLibraryPageState extends State<CaseLibraryPage> {
  final List<Map<String, String>> items = [
    {'title': 'Case 1: Theft', 'type': 'Case'},
    {'title': 'Policy: Tax Reform', 'type': 'Policy'},
    {'title': 'Case 2: Fraud', 'type': 'Case'},
    {'title': 'Policy: Education Act', 'type': 'Policy'},
    {'title': 'Case 3: Assault', 'type': 'Case'},
  ];

  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Case Library',
                textStyle: const TextStyle(
                  color: Color(0xFFFFD54F), // Gold Yellow
                  fontSize: 24,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        backgroundColor: const Color(0xFF1A237E), // Midnight Blue
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Points: 250',
              style: const TextStyle(
                color: Color(0xFF2E7D32), // Emerald Green
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => filter = 'All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: filter == 'All'
                        ? const Color(0xFF2E7D32) // Emerald Green
                        : const Color(0xFF37474F), // Cool Slate Gray
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'All',
                    style: TextStyle(color: Color(0xFFFDFEFE)), // Soft Ivory
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => filter = 'Case'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: filter == 'Case'
                        ? const Color(0xFF2E7D32) // Emerald Green
                        : const Color(0xFF37474F), // Cool Slate Gray
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Cases',
                    style: TextStyle(color: Color(0xFFFDFEFE)), // Soft Ivory
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => filter = 'Policy'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: filter == 'Policy'
                        ? const Color(0xFF2E7D32) // Emerald Green
                        : const Color(0xFF37474F), // Cool Slate Gray
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Policies',
                    style: TextStyle(color: Color(0xFFFDFEFE)), // Soft Ivory
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (filter != 'All' && items[index]['type'] != filter) {
                  return const SizedBox.shrink();
                }
                return AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    color: const Color(0xFF37474F), // Cool Slate Gray
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF1A237E), // Midnight Blue
                            title: Text(
                              items[index]['title']!,
                              style: const TextStyle(
                                color: Color(0xFFFFD54F), // Gold Yellow
                              ),
                            ),
                            content: Text(
                              'Details for ${items[index]['title']}',
                              style: const TextStyle(
                                color: Color(0xFFFDFEFE), // Soft Ivory
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Color(0xFF2E7D32)), // Emerald Green
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            items[index]['title']!,
                            style: const TextStyle(
                              color: Color(0xFFFDFEFE), // Soft Ivory
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}