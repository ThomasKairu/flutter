import 'package:angel_fetus/presentation/trackingtools/kick_counter_page.dart';
import 'package:angel_fetus/presentation/trackingtools/mood_tracker_page.dart';
import 'package:angel_fetus/presentation/trackingtools/pregnancy_tracker_page.dart';
import 'package:angel_fetus/presentation/trackingtools/weight_tracker_page.dart';
import 'package:flutter/material.dart';

class TrackingTools extends StatelessWidget {
  const TrackingTools({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking Tools'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: _trackerTools.map((tool) => TrackerCard(tool)).toList(),
        ),
      ),
    );
  }
}

class TrackerTool {
  final Color color;
  final String title;
  final String buttonText;
  final Widget destination;

  TrackerTool({required this.color, required this.title, required this.buttonText, required this.destination});
}

List<TrackerTool> _trackerTools = [
  TrackerTool(
    color: Colors.pink,
    title: 'Pregnancy Tracker',
    buttonText: 'Track now',
    destination: const PregnancyTrackerPage(),
  ),
  TrackerTool(
    color: Colors.blue,
    title: 'Kick Counter',
    buttonText: 'Count now',
    destination: const KickCounterPage(),
  ),
  TrackerTool(
    color: Colors.green,
    title: 'Weight Tracker',
    buttonText: 'Track now',
    destination: const WeightTrackerPage(),
  ),
  TrackerTool(
    color: Colors.yellow,
    title: 'Mood Tracker',
    buttonText: 'Track now',
    destination: const MoodTrackerPage(),
  ),
];

class TrackerCard extends StatelessWidget {
  final TrackerTool tool;

  const TrackerCard(this.tool, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: tool.color,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => tool.destination));
                },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tool.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => tool.destination));
                                },
                child: Text(tool.buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}