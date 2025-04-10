import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vivi25/components/chat_bubble.dart';
import 'package:vivi25/sum_api_service.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  File? _pickedFile;
  bool _isLoading = false;

  void _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    if (_pickedFile == null) {
      setState(() {
        _messages
            .add({'role': 'bot', 'message': 'Please upload a document first.'});
      });
      return;
    }

    setState(() {
      _messages.add({'role': 'user', 'message': message});
      _isLoading = true;
      _controller.clear();
    });

    final reply = await SumApiService.sendQA(message, _pickedFile!);
    setState(() {
      _messages.add({'role': 'bot', 'message': reply});
      _isLoading = false;
    });
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'txt'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
    }
  }

  void _summarizeFile() async {
    if (_pickedFile == null) return;

    setState(() {
      _messages.add({
        'role': 'user',
        'message': '[Uploaded: ${_pickedFile!.path.split('/').last}]'
      });
      _isLoading = true;
    });

    final summary = await SumApiService.summarizeDocument(_pickedFile!);
    setState(() {
      _messages.add({'role': 'bot', 'message': summary});
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LegalDoc Assistant'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  text: msg['message']!,
                  isUser: msg['role'] == 'user',
                );
              },
            ),
          ),
          if (_pickedFile != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Selected: ${_pickedFile!.path.split('/').last}"),
            ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.upload_file),
                onPressed: _pickFile,
              ),
              ElevatedButton(
                onPressed: _summarizeFile,
                child: const Text('Summarize'),
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Ask a question...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  onSubmitted: _sendMessage,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _sendMessage(_controller.text),
              )
            ],
          ),
        ],
      ),
    );
  }
}
