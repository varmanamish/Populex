import 'package:flutter/material.dart';

class VirtualTrialRoom extends StatelessWidget {
  final String? mode;

  const VirtualTrialRoom({super.key, this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Trial Room',
            style: TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: Center(
        child: Text(
          mode == 'spectate'
              ? 'Spectating Trial Room'
              : mode == 'judge'
                  ? 'Participating as Judge'
                  : 'Participating as Lawyer',
          style: const TextStyle(color: Color(0xFFF5F6F5), fontSize: 20),
        ),
      ),
    );
  }
}
