import 'package:flutter/material.dart';

import '../model/track.dart';
import '../service/fetch_tracks.dart';

class TrackProvider extends ChangeNotifier {
  final _service = TrackService();
  List<Track> _tracks = [];

  List<Track> get tracks => _tracks;

  Future<void> getAllTracks() async {
    final response = await _service.fetchTracks();

    _tracks = response.tracks;

    notifyListeners();
  }
}
