import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> values = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[0]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[1]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[2]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[3]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[4]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[5]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[6]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Text(values[7]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: () {},
                  child:Text(values[8]),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.replay_rounded),
                label: const Text('Restart')),
          ],
        ),
      ),
    );
  }
}
