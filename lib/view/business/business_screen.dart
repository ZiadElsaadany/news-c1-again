
import 'package:flutter/material.dart';
import 'package:news_c1/provider/news_provider.dart';
import 'package:news_c1/shared/news_widget.dart';
import 'package:provider/provider.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Provider.of<NewsProvider>(context,listen: false).getDataFromApi(categoryName:'business');
  }
  Widget build(BuildContext context) {
    return Provider.of<NewsProvider>(context).loading == true?
      const Center(child: CircularProgressIndicator()):
      NewsWidget(data: Provider.of<NewsProvider>(context).data);
  }
}
