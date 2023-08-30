import 'package:dio/dio.dart';
import '../models/playlist_item_list.dart';


class PlaylistService {
  final Dio _dio = Dio();

  Future<List<PlaylistItem>> fetchPlaylistItems({required String apiKey, required String playlistId }) async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/youtube/v3/playlistItems',
        queryParameters: {
          'part': 'snippet',
          'playlistId': playlistId,
          'key': apiKey,
        },
      );

      final List<dynamic> itemList = response.data['items'];
      final List<PlaylistItem> playlistItems = itemList.map((itemJson) {
        return PlaylistItem.fromJson(itemJson);
      }).toList();

      return playlistItems;
    } catch (error) {
      throw Exception('Failed to fetch playlist items');
    }
  }

}