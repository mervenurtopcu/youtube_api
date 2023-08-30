import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/view/video_view.dart';

import '../view_model/youtube_provider.dart';

class YoutubeView extends ConsumerStatefulWidget {
  const YoutubeView({super.key});

  @override
  ConsumerState createState() => _YoutubeViewState();
}

class _YoutubeViewState extends ConsumerState<YoutubeView> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(youtubeProvider).playListItemList;
    return Scaffold(
        appBar: AppBar(
          title: Text('Youtube'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index].title),
                        subtitle: Text(list[index].description),
                        leading: Image.network(list[index].thumbnailUrl),
                        trailing: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoView(id: list[index].videoId),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: list.length))
          ],
        ));
  }
}
