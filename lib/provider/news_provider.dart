import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NewsProvider extends ChangeNotifier{


  // methods from api

List  data = [] ;
bool loading= false ;
bool loadingSearch= false;
List dataFromSearch = [] ;

  getDataFromApi({required String categoryName} )  async {
    data=[];
    loading  = true;
    http.Response res =await http.get(
        Uri.parse(
    'https://newsapi.org/v2/top-headlines?apiKey=9273e8c3654242b380ed9fdbba8f8254&category=$categoryName'));
     data =  json.decode( res.body )['articles'] ; // { }
     loading = false;
     notifyListeners();
  }

  search({required String keyWord} )async {
    dataFromSearch=[] ;
    loadingSearch = true;
    http.Response resp = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=$keyWord&apiKey=9273e8c3654242b380ed9fdbba8f8254'));

    dataFromSearch = jsonDecode(resp.body)['articles'];
    loadingSearch = false;
    notifyListeners();
  }

}