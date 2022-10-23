import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NewsProvider extends ChangeNotifier{

  List data = [] ;
  bool loading= false;
  getNews({required String categoryName} )  async{
    loading =true;

    //https://newsapi.org/v2/top-headlines?country=eg&apiKey=9273e8c3654242b380ed9fdbba8f8254&category=sports

    http.Response res =  await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=9273e8c3654242b380ed9fdbba8f8254&category=$categoryName'));
  if( res.statusCode== 200 ) {
    data = json.decode(res.body)['articles'];
  }
      loading =false;
  notifyListeners();
  }


}