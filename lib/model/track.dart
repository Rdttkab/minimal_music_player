class Track {
  final String songName;
  final String artistName;
  final Share share;

  const Track(
      {required this.songName, required this.artistName, required this.share});

  factory Track.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String title,
        'subtitle': String subtitle,
        'share': Share share,
        // 'uri': String uri
      } =>
        Track(songName: title, artistName: subtitle, share: share),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class Chart {
  final List<Track> tracks;

  const Chart({required this.tracks});

  factory Chart.fromJson(Map<String, dynamic> json) {
    return Chart(
      tracks: List<Track>.from(
        json['tracks'].map(
          (x) => Track.fromJson(x),
        ),
      ),
    );
  }
}

class Share {
  final String albumImagePath;
  final String audioPath;

  const Share({
    required this.albumImagePath,
    required this.audioPath,
  });

  factory Share.fromJson(Map<String, dynamic> json) {
    return Share(
      albumImagePath: json['image'],
      audioPath: json['href'],
    );
  }
}
