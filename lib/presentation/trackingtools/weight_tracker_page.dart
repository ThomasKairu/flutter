import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WeightTrackerPage extends StatefulWidget {
  const WeightTrackerPage({super.key});

  @override
  WeightTrackerPageState createState() => WeightTrackerPageState();
}

class WeightTrackerPageState extends State<WeightTrackerPage> {
  final _weightController = TextEditingController();
  List<WeightEntry> _weights = []; 
  late SupabaseClient _supabase; 

  @override
  void initState() {
    super.initState();
    _supabase = Supabase.instance.client; 
    _fetchWeights(); 
  }

  Future<void> _fetchWeights() async {
  final response = await _supabase.from('weights').select('weight, created_at');
  setState(() {
    _weights = response.map((weight) => WeightEntry(
          weight: weight['weight'] as double,
          date: weight['created_at'] as DateTime,
        )).toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  });
}

  Future<void> _addWeight(double weight) async {
    final response = await _supabase.from('weights').insert({
      'weight': weight,
      'created_at': DateTime.now().toIso8601String(),
    });
    if (response.error != null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding weight: ${response.error}')),
      );
    } else {
      _fetchWeights(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weight:'),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter weight in kg',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_weightController.text.isNotEmpty) {
                  final weight = double.parse(_weightController.text);
                  _addWeight(weight); 
                  _weightController.clear(); 
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a weight')),
                  );
                }
              },
              child: const Text('Track Weight'),
            ),
            const SizedBox(height: 20),
            _weights.isEmpty
                ? const Text('No weights recorded')
                : Expanded(
                    child: ListView.builder(
                      itemCount: _weights.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Text(
                              '${_weights[index].weight} kg',
                              style: const TextStyle(fontSize: 18),
                            ),
                            title: Text(
                              _weights[index].date.toString().split(' ').first,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class WeightEntry {
  final double weight;
  final DateTime date;

  WeightEntry({required this.weight, required this.date});
}