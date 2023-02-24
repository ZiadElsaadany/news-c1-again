

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_online_adding_bloc/cubit/news_states.dart';

class NewsCubit extends Cubit< NewsStates >{

 NewsCubit():super(InitialState());

 static NewsCubit getInstance(BuildContext context){
   return BlocProvider.of(context);
 }

 int currentIndexForScreens = 0;

 changeIndex( {required int index} )  {

   currentIndexForScreens  = index;

   emit(ChangeNavIndexState()) ; // notify

 }

 List ?  dataFromApi ;
 getDataFromApi( {required String category } )  async{
   emit(NewsLoadingState()) ;
  try{
    Response response = await  Dio().get(
      //baseUrl + endpoint  ,
        "https://newsapi.org/v2/top-headlines" ,
        queryParameters:  {
          "apiKey":"9273e8c3654242b380ed9fdbba8f8254",
          "category":category
        }
    );

    emit(NewsSuccessState());
  dataFromApi = response.data['articles'];
    debugPrint( '$dataFromApi');
  }
  catch(e) {

    emit(NewsFailureState());
  }




 }
 // baseurl/endpoint?





}























//
//
//
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_online_adding_bloc/cubit/news_states.dart';
// import 'package:news_online_adding_bloc/home_view_body.dart';
//
// class NewsCubit extends Cubit<NewsStates>  {
//
//
//   NewsCubit( ):super( InitState()) ;
//
//   static NewsCubit getInstance(BuildContext context){
//     return BlocProvider.of(context);
//   }
//
//
//   List<Widget> screens = [HomeViewBody(), HomeViewBody() , HomeViewBody()] ;
//   int currentIndex = 0 ;
//   void changeState ( {required int index}) {
//     currentIndex  = index ;
//     emit(ChangeBottomNavBarState());
//   }
//
//
//   /// / get news     -->   loading success  failure   no internet
//
//
//  List  ? dataFromApi ;
//  getNewsFromApi ( {required String category}) async {
//
//     emit(LoadingState());
// try {
//
//   Response response =  await Dio().get(
//
//     // base url  + endpoint,
//     //queryParameters
//       "https://newsapi.org/v2/top-headlines",
//       queryParameters:  {
//         "apiKey" : "9273e8c3654242b380ed9fdbba8f8254",
//   "country" : "eg",
//   "category"  : category
//   }
//
//
//   );
//   dataFromApi = response.data["articles"];
//
//   emit(SuccessState());
//
// }
// catch (e) {
//   debugPrint( e.toString());
//   emit(FailureState());
// }
//   }
//
//
//
//
//
// }