import 'package:flutter/material.dart';
import 'package:minimal_music_player/pages/track_page.dart';
import 'package:provider/provider.dart';

import '../Components/my_drawer.dart';
import '../providers/track_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(child: Text('P L A Y L I S T')),
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const MyDrawer(),
      body: Consumer<TrackProvider>(
        builder: (context, value, child) {
          final tracks = value.tracks;
          return ListView.builder(
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              return ListTile(
                title: Text(track.songName),
                subtitle: Text(track.artistName),
                leading: Image.network(track.share.albumImagePath),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TrackPage()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
