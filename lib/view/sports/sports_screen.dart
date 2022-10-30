import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/news_provider.dart';
import '../../shared/news_widget.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
 Provider.of<NewsProvider>(context,listen: false).getDataFromApi(categoryName:'sports');
  }

  Widget build(BuildContext context) {
    return Provider.of<NewsProvider>(context).loading == true?
    Center(child: CircularProgressIndicator()):

    NewsWidget(data: Provider.of<NewsProvider>(context).data);

  }
}
