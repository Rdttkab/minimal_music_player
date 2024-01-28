import 'package:flutter/material.dart';
import 'package:minimal_music_player/Components/neu_box.dart';
import 'package:minimal_music_player/providers/track_provider.dart';
import 'package:provider/provider.dart';

class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Text('P L A Y L I S T'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    )
                  ],
                ),
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const Icon(Icons.music_note),
                      ),
                      const Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Song Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Artist Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
