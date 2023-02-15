


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List newsInfo = [];
  void fetchData() async {
    var _responseData = await http.get(
      Uri.parse("https://newsapi.org/v2/top-headlines?apikey=9273e8c3654242b380ed9fdbba8f8254&country=eg"),
    );
    debugPrint("************ Http Data is ${jsonDecode(_responseData.body)} **************** ");
    Response response = await Dio().get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters:
      {
        'apikey' : '9273e8c3654242b380ed9fdbba8f8254',
        'country' : 'eg',
      }
    );
    debugPrint("************* Status code is ${response.statusCode} ************ ");
    // print("Data is ${response.data}");
    setState(() {
      newsInfo.addAll(response.data['articles']);
    });
    print("Articles is ${newsInfo}");

  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News App"),),
      body: newsInfo.isEmpty ?
          Center(child: CircularProgressIndicator(),) :
          ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(newsInfo[index]['title']),
                SizedBox(height: 5,),
                Image.network(newsInfo[index]['urlToImage'],fit: BoxFit.fill,width: double.infinity,),
                SizedBox(height: 5,),
                Text(newsInfo[index]['description']),
              ],
            ),
          );
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 10);
        },
      )
    );
  }
}
