class VideoItem {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;

  VideoItem({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final thumbnails = snippet['thumbnails'];

    return VideoItem(
      id: json['id'],
      title: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: thumbnails['medium']['url'],
    );
  }
}