import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/news_provider.dart';
import '../../shared/news_widget.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<NewsProvider>(context,listen: false).getDataFromApi(categoryName:'science');
  }

  Widget build(BuildContext context) {
    return Provider.of<NewsProvider>(context).loading == true?
    Center(child: CircularProgressIndicator()):

    NewsWidget(data: Provider.of<NewsProvider>(context).data);

  }
}
