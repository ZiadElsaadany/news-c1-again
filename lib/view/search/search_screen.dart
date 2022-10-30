import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/news_provider.dart';

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
              child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.15,
                              placeholder: 'assets/images/loadingPicture.jpg',
                              imageErrorBuilder: (c, b, v) {
                                return Image.asset(
                                    'assets/images/loadingPicture.jpg');
                              }, // image from asset
                              image: Provider.of<NewsProvider>(context)
                                      .dataFromSearch[index]['urlToImage'] ??
                                  '',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<NewsProvider>(context).dataFromSearch[index]
                                        ['title'] ??
                                    '',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Provider.of<NewsProvider>(context).dataFromSearch[index]
                                        ['"publishedAt'] ??
                                    '',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                // data
                itemCount: Provider.of<NewsProvider>(context).dataFromSearch.length,
                separatorBuilder: (ctx, index) {
                  return Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.grey,
                    indent: 40,
                    endIndent: 40,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
