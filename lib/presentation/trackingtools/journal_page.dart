import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  final List<Map<String, dynamic>> journalEntries;

  const JournalPage({super.key, required this.journalEntries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kick Journal')),
      body: ListView.builder(
        itemCount: journalEntries.length,
        itemBuilder: (context, index) {
          final entry = journalEntries[index];
          return ListTile(
            title: Text(
                '${entry['kick_count']} Kicks'
            ),
            subtitle: Text(
                entry['start_time'].toString().substring(0, 16)),
          );
        },
      ),
    );
  }
}
