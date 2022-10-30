import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/news_provider.dart';
import '../../shared/news_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value) {
                  Provider.of<NewsProvider>(context,listen: false).search(keyWord: value);
                  },
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search',
                    hintText: 'Search for news',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ))),
              ),
            ),
          Provider.of<NewsProvider>(context).dataFromSearch.isEmpty?
        Center(child: Text('Search for news'))
        : Expanded(
              child:NewsWidget(data: Provider.of<NewsProvider>(context).dataFromSearch)

          )
          ],
        ),
      ),
    );
  }
}
