import 'package:flutter/material.dart';
import 'virtual_trial_room.dart';

class CaseDetailPage extends StatefulWidget {
  final Map<String, String> caseData;
  final int userRating;

  const CaseDetailPage(
      {super.key, required this.caseData, required this.userRating});

  @override
  _CaseDetailPageState createState() => _CaseDetailPageState();
}

class _CaseDetailPageState extends State<CaseDetailPage> {
  String? selectedRole;

  Color _getBackgroundColor(String caseType) {
    switch (caseType) {
      case 'Criminal Cases':
        return Colors.blue[700]!;
      case 'Civil Cases':
        return Colors.orange[700]!;
      case 'Consumer Cases':
        return Colors.green[700]!;
      case 'Environmental/Public Interest':
        return Colors.brown[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    int minRating = int.tryParse(widget.caseData['minRating'] ?? '0') ?? 0;
    int minLawyerRating = minRating;
    int minJudgeRating = minRating + 20;
    bool canEnterTrial = widget.userRating >= minLawyerRating;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.caseData['title']!,
            style: const TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rating: ${widget.userRating}',
              style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color:
                      _getBackgroundColor(widget.caseData['type'] ?? 'Unknown'),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Text(
                    'Case Image Placeholder',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.caseData['title']!,
                style: const TextStyle(
                  color: Color(0xFFF5F6F5),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Rest of the case details...
              if (canEnterTrial) ...[
                if (widget.userRating >= minJudgeRating)
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const VirtualTrialRoom(mode: 'judge'),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A86B)),
                    child: const Text('Enter Trial Room as Judge',
                        style: TextStyle(color: Color(0xFFF5F6F5))),
                  ),
                if (widget.userRating >= minLawyerRating &&
                    widget.userRating < minJudgeRating) ...[
                  DropdownButton<String>(
                    value: selectedRole,
                    hint: const Text('Choose Role',
                        style: TextStyle(color: Colors.black)),
                    items: ['Plaintiff', 'Defendant', 'Judge']
                        .map((role) =>
                            DropdownMenuItem(value: role, child: Text(role)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedRole = value),
                    dropdownColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: selectedRole != null
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VirtualTrialRoom(mode: 'lawyer'),
                              ),
                            )
                        : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A86B)),
                    child: const Text('Enter Trial Room',
                        style: TextStyle(color: Color(0xFFF5F6F5))),
                  ),
                ],
              ],
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const VirtualTrialRoom(mode: 'spectate'),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A6B6F)),
                child: const Text('Spectate',
                    style: TextStyle(color: Color(0xFFF5F6F5))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
