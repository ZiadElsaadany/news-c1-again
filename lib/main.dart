
import 'package:flutter/material.dart';
import 'package:news_c1/provider/news_provider.dart';
import 'package:news_c1/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void  main ( ) {
  runApp(ChangeNotifierProvider(
      create: ( ctx) {
        return NewsProvider();
      },
      child: NewsApp()));
}
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
