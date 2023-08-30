import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_api/view/youtube_view.dart';

void main() => runApp(const ProviderScope(child: MyApp(),) );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Material App',
        theme: ThemeData.dark(),
        home:const YoutubeView()
    );
  }
}

