import 'package:flutter/material.dart';
import "dart:math";

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

List<bool> selected = [true, false];

class _GamePageState extends State<GamePage> {
  winDialog(BuildContext context, String title) {
    Widget confirmButton = ElevatedButton.icon(
      icon: const Icon(Icons.replay_rounded),
      label: const Text('Restart'),
      onPressed: () {
        Navigator.of(context).pop();
        reload();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      actions: [
        confirmButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
  List<List<int>> waysToWin = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  bool playable = selected[0] ? true : false;
  String playerCharacter = selected[0] ? 'X' : 'O';
  int filled = 0;

  void reload() {
    setState(() {
      values = [
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
      playable = selected[0] ? true : false;
      filled = 0;
      playerCharacter = selected[0] ? 'X' : 'O';
    });
    if (selected[1] == true) computerTurn();
  }

  bool check(String character) {
    for (List<int> i in waysToWin) {
      int row = 0;
      for (int j in i) {
        if (values[j] == character) row++;
      }
      if (row == 3) return true;
    }
    if (filled == 9) {
      winDialog(context, 'Tie');
    }
    return false;
  }

  void computerTurn() {
    String computerCharacter = playerCharacter == 'X' ? 'O' : 'X';
    bool completeLine(String character) {
      for (List<int> i in waysToWin) {
        int inRow = 0;
        int playableSpot = 0;
        for (int j in i) {
          if (values[j] == character) {
            inRow++;
          } else if (values[j] == '') {
            playableSpot = j;
          }
        }
        if (inRow == 2 && values[playableSpot] == '') {
          values[playableSpot] = (computerCharacter);
          playable = true;
          return playable;
        }
      }
      return playable;
    }

    if (!completeLine(computerCharacter)) {
      if (!completeLine(playerCharacter)) {
        List<int> playableSpots = [];
        for (int i = 0; i < values.length; i++) {
          if (values[i] == '') {
            playableSpots.add(i);
          }
        }
        if (playableSpots.isNotEmpty) {
          values[playableSpots[Random().nextInt(playableSpots.length)]] =
              computerCharacter;
          playable = true;
        }
      }
    }
    filled++;
    if (check(computerCharacter)) {
      winDialog(context, 'Computer Wins');
    }
  }

  void playerTurn(int square) {
    setState(() {
      values[square] = playerCharacter;
    });
    playable = false;
    filled++;
    if (check(playerCharacter)) {
      winDialog(context, 'You Win');
    } else {
      computerTurn();
    }
  }

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
                  heroTag: null,
                  onPressed: (values[0] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(0);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      values[0],
                      style: const TextStyle(
                        fontFamily: 'Heavitas',
                        fontSize: 50,
                        color: Color(0xFF0061a4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[1] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(1);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[1],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[2] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(2);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[2],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[3] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(3);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[3],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[4] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(4);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[4],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[5] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(5);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[5],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[6] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(6);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[6],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[7] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(7);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[7],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.large(
                  heroTag: null,
                  onPressed: (values[8] != '') || (!playable)
                      ? null
                      : () {
                          playerTurn(8);
                        },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(values[8],
                        style: const TextStyle(
                          fontFamily: 'Heavitas',
                          fontSize: 50,
                          color: Color(0xFF0061a4),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                reload();
              },
              icon: const Icon(Icons.replay_rounded),
              label: const Text('Restart'),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              direction: Axis.horizontal,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < 2; i++) {
                    selected[i] = i == index;
                  }
                });
                reload();
              },
              isSelected: selected,
              children: const [
                Text(
                  'X',
                  style: TextStyle(
                    fontFamily: 'Heavitas',
                  ),
                ),
                Text(
                  'O',
                  style: TextStyle(
                    fontFamily: 'Heavitas',
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
