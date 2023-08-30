class PlaylistItem {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoId;
  // Diğer gerekli alanlar buraya eklenebilir

  PlaylistItem({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoId,
  });

  factory PlaylistItem.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final thumbnails = snippet['thumbnails'];

    return PlaylistItem(
      id: json['id'],
      title: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: thumbnails['medium']['url'],
      videoId: snippet['resourceId']['videoId'],
    );
  }
}