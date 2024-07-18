import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  MoodTrackerPageState createState() => MoodTrackerPageState();
}

class MoodTrackerPageState extends State<MoodTrackerPage> {
  final List<String> _moods = [
    'Angry',
    'Anxious',
    'Calm',
    'Confused',
    'Delighted',
    'Depressed',
    'Determined',
    'Disgusted',
    'Excited',
    'Fearful',
    'Frustrated',
    'Grateful',
    'Happy',
    'Inspired',
    'Jealous',
    'Lonely',
    'Nervous',
    'Proud',
    'Relieved',
    'Sad',
    'Surprised',
  ];
  List<String> _selectedMoods = [];
  late SupabaseClient _supabase;

  @override
  void initState() {
    super.initState();
    _supabase = Supabase.instance.client;
    _createMoodsTable();
    _fetchMoods();
  }

  Future<void> _createMoodsTable() async {
    final response = await _supabase.from('moods').select('*').limit(0);
    if (response.isNotEmpty) {
      await _supabase.from('moods').insert([
        {'mood': 'Angry'},
        {'mood': 'Anxious'},
        {'mood': 'Calm'},
        {'mood': 'Confused'},
        {'mood': 'Delighted'},
        {'mood': 'Depressed'},
        {'mood': 'Determined'},
        {'mood': 'Disgusted'},
        {'mood': 'Excited'},
        {'mood': 'Fearful'},
        {'mood': 'Frustrated'},
        {'mood': 'Grateful'},
        {'mood': 'Happy'},
        {'mood': 'Inspired'},
        {'mood': 'Jealous'},
        {'mood': 'Lonely'},
        {'mood': 'Nervous'},
        {'mood': 'Proud'},
        {'mood': 'Relieved'},
        {'mood': 'Sad'},
        {'mood': 'Surprised'},
      ]);
    }
  }

  Future<void> _fetchMoods() async {
    final response = await _supabase.from('moods').select('mood, created_at');
    setState(() {
      _selectedMoods = response.map((mood) => mood['mood'] as String).toList();
    });
  }

  Future<void> _addMood(String mood) async {
    final response = await _supabase.from('moods').insert({'mood': mood});
    if (response.error != null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding mood: ${response.error}')),
      );
    } else {
      _fetchMoods();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mood:'),
                DropdownButton<String>(
                  value: _selectedMoods.isNotEmpty ? _selectedMoods.last : null,
                  onChanged: (value) {
                    if (value != null) {
                _addMood(value);
                      setState(() {
                        _selectedMoods.add(value);
                      });
                    }
                  },
                  items: _moods.map<DropdownMenuItem<String>>((String mood) {
                    return DropdownMenuItem<String>(
                      value: mood,
                      child: Text(mood),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Text(
                  'Moods: ${_selectedMoods.join(', ')},',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedMoods.length,
              itemBuilder: (context, index) {
                final mood = _selectedMoods[index];
                final date = DateTime.fromMillisecondsSinceEpoch(
                  _selectedMoods.firstWhere((element) => element == mood).length,
                );
                return ListTile(
                  leading: Text(date.day.toString()),
                  title: Text(date.month.toString()),
                  subtitle: Text(mood),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}