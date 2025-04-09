import 'package:flutter/material.dart';
import '../components/case_card.dart';
import '../components/category_button.dart';
import 'case_detail_page.dart';

class TrialRoomPage extends StatefulWidget {
  const TrialRoomPage({super.key});

  @override
  _TrialRoomPageState createState() => _TrialRoomPageState();
}

class _TrialRoomPageState extends State<TrialRoomPage> {
  String _selectedCategory = 'All';
  final Map<String, List<Map<String, String>>> cases = {
    'All': [
      {
        'title': 'State vs. John Doe',
        'description': 'A high-profile murder case...',
        'minRating': '60',
        'type': 'Criminal Cases'
      },
      // Other cases...
    ],
    // Other categories...
  };

  @override
  void initState() {
    super.initState();
    _selectedCategory = cases.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final filteredCases = cases[_selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial Room',
            style: TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF0F1C2E),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: cases.keys
                    .map(
                      (category) => CategoryButton(
                        label: category,
                        isSelected: _selectedCategory == category,
                        onPressed: () =>
                            setState(() => _selectedCategory = category),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select a Case',
              style: TextStyle(
                  color: Color(0xFFF5F6F5),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCases.length,
              itemBuilder: (context, index) => CaseCard(
                caseData: filteredCases[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseDetailPage(
                      caseData: filteredCases[index],
                      userRating: 65,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
