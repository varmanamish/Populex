import 'package:flutter/material.dart';
import '../components/case_card.dart';
import '../components/category_button.dart';
import 'case_detail_page.dart';

class TrialRoomPage extends StatefulWidget {
  const TrialRoomPage({super.key});

  @override
  State<TrialRoomPage> createState() => _TrialRoomPageState();
}

class _TrialRoomPageState extends State<TrialRoomPage> {
  String _selectedCategory = 'All';

  final Map<String, List<Map<String, String>>> cases = {
    'All': [
      {
        'title': 'State vs. John Doe',
        'description':
            'A high-profile murder case involving a disputed alibi. Evidence includes witness testimonies and forensic reports. The case has drawn significant media attention.',
        'minRating': '60',
        'type': 'Criminal Cases'
      },
      {
        'title': 'Smith vs. ABC Corp',
        'description':
            'Civil dispute over a breached business contract. Involves financial compensation and legal documentation. Ongoing negotiations have failed.',
        'minRating': '50',
        'type': 'Civil Cases'
      },
      {
        'title': 'Green Earth PIL',
        'description':
            'Public interest litigation on deforestation. Evidence includes satellite imagery and expert testimonies. Aims to enforce environmental laws.',
        'minRating': '70',
        'type': 'Environmental/Public Interest'
      },
      {
        'title': 'Consumer vs. XYZ Ltd',
        'description':
            'Consumer complaint about defective products. Evidence includes product samples and customer complaints. Seeks refund and damages.',
        'minRating': '40',
        'type': 'Consumer Cases'
      },
    ],
    'Criminal Cases': [
      {
        'title': 'State vs. John Doe',
        'description':
            'A high-profile murder case involving a disputed alibi. Evidence includes witness testimonies and forensic reports. The case has drawn significant media attention.',
        'minRating': '60',
        'type': 'Criminal Cases'
      },
    ],
    'Civil Cases': [
      {
        'title': 'Smith vs. ABC Corp',
        'description':
            'Civil dispute over a breached business contract. Involves financial compensation and legal documentation. Ongoing negotiations have failed.',
        'minRating': '50',
        'type': 'Civil Cases'
      },
    ],
    'Consumer Cases': [
      {
        'title': 'Consumer vs. XYZ Ltd',
        'description':
            'Consumer complaint about defective products. Evidence includes product samples and customer complaints. Seeks refund and damages.',
        'minRating': '40',
        'type': 'Consumer Cases'
      },
    ],
    'Environmental/Public Interest': [
      {
        'title': 'Green Earth PIL',
        'description':
            'Public interest litigation on deforestation. Evidence includes satellite imagery and expert testimonies. Aims to enforce environmental laws.',
        'minRating': '70',
        'type': 'Environmental/Public Interest'
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedCategory = cases.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final filteredCases = cases[_selectedCategory] ?? [];

    if (filteredCases.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Trial Room',
              style: TextStyle(color: Color(0xFF174AC9))),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(
          child: Text('No cases available',
              style: TextStyle(color: Colors.black87)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial Room',
            style: TextStyle(color: Color(0xFF174AC9))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton('All', _selectedCategory == 'All'),
                  _buildCategoryButton(
                      'Criminal Cases', _selectedCategory == 'Criminal Cases'),
                  _buildCategoryButton(
                      'Civil Cases', _selectedCategory == 'Civil Cases'),
                  _buildCategoryButton(
                      'Consumer Cases', _selectedCategory == 'Consumer Cases'),
                  _buildCategoryButton('Environmental/Public Interest',
                      _selectedCategory == 'Environmental/Public Interest'),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select a Case',
              style: TextStyle(
                  color: Color(0xFF174AC9),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCases.length,
              itemBuilder: (context, index) {
                final caseData = filteredCases[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CaseDetailPage(
                          caseData: caseData,
                          userRating: 65,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color(0xFFE6F3FF),
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
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              caseData['description']!.split('\n').first,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Min Rating: ${caseData['minRating']}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ],
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

  Widget _buildCategoryButton(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedCategory = label;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(0xFF174AC9) : const Color(0xFFACD4FC),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        child: Text(label,
            style:
                TextStyle(color: isSelected ? Colors.white : Colors.black87)),
      ),
    );
  }
}
