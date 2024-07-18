import 'package:flutter/material.dart';

class KickCounterPage extends StatefulWidget {
  const KickCounterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KickCounterPageState createState() => _KickCounterPageState();
}

class _KickCounterPageState extends State<KickCounterPage> {
  int _kickCount = 0;

  void _incrementKicks() {
    setState(() {
      _kickCount++;
    });
  }

  void _decrementKicks() {
    setState(() {
      _kickCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kick Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Kicks: $_kickCount',
              style: const TextStyle(fontSize: 48.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: _incrementKicks,
                    child: const Text('+'),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: MaterialButton(
                    onPressed: _decrementKicks,
                    child: const Text('-'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}