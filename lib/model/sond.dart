import 'dart:convert';

class NetworkResponse {
  final String message;

  NetworkResponse({this.message});

  factory NetworkResponse.fromRawJson(String str) =>
      NetworkResponse.fromJson(json.decode(str));

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      NetworkResponse(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}

class Song {
  final String songName;
  final String artistName;
  final String albumImagePath;
  final String audioPath;

  const Song({
    required this.songName,
    required this.artistName,
    required this.albumImagePath,
    required this.audioPath,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        songName: json['title'],
        artistName: json['subtitle'],
        albumImagePath: json['coverart'],
        audioPath: json['uri'],
      );

  Map<String, dynamic> toJson() => {
        'title': songName,
        'subtitle': artistName,
        'coverart': albumImagePath,
        'uri': audioPath,
      };
}

class Tracks {
  final List<Song> tracks;

  Tracks({required this.tracks});

  factory Tracks.fromRawJson(String str) => Tracks.fromJson(json.decode(str));

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
      tracks: List<Song>.from(json["tracks"].map((x) => Song.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
      };
}
