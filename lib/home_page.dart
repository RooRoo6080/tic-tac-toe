import 'package:flutter/material.dart';
import 'package:tic_tac_toe/about_page.dart';
import 'package:tic_tac_toe/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const GamePage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Play'),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AboutPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.info),
            label: const Text('About'),
          ),
        ],
      ),
    );
  }
}
