import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/playlist_item_list.dart';
import '../services/youtube_service.dart';
import '../utils/keys.dart';


class YoutubeProvider extends ChangeNotifier{
  YoutubeProvider() {
    fetchItems();
  }

   final PlaylistService _playlistService = PlaylistService();

    List<PlaylistItem> _playListItemList = [];
    List<PlaylistItem> get playListItemList => _playListItemList;

    Future<void> fetchItems() async {
      try {
        _playListItemList = await _playlistService.fetchPlaylistItems(
          apiKey: API_KEY,
          playlistId: 'PL1k5oWAuBhgXdw1BbxVGxxWRmkGB1C11l',
        );
        notifyListeners();
      } catch (error) {
        throw Exception('Failed to fetch playlist items');
      }
    }
}

final youtubeProvider = ChangeNotifierProvider((ref) => YoutubeProvider());
