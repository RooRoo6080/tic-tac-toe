import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> values = [
    '',
    'X',
    '',
    '',
    'O',
    'X',
    '',
    '',
    '',
  ];
  int count = 0;
  List<List<int>> waysToWin = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]];
  bool close = false;

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
                  onPressed: values[0] != '' ? null : (){},
                  child: Text(values[0]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: values[1] != '' ? null : (){},
                  child: Text(values[1]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: values[2] != '' ? null : (){},
                  child: Text(values[2]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  onPressed: values[3] != '' ? null : (){},
                  child: Text(values[3]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: values[4] != '' ? null : (){},
                  child: Text(values[4]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: values[5] != '' ? null : (){},
                  child: Text(values[5]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  onPressed: values[6] != '' ? null : (){},
                  child: Text(values[6]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: values[7] != '' ? null : (){},
                  child: Text(values[7]),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  onPressed: values[8] != '' ? null : (){},
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
