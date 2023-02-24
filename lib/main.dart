import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
import 'package:news_online_adding_bloc/view/details/details_view.dart';
import 'package:news_online_adding_bloc/view/home/home_view.dart';
import 'package:news_online_adding_bloc/view/search_view.dart';

void main( ) {
  runApp(NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
           create: (context)=>NewsCubit()..getDataFromApi(
             category:  "sports"
           ),
      child: MaterialApp(
        home: const HomeView(),
        routes: {
         SearchView.routeName: (ctx)=>const SearchView() ,
        DetailsView.routeName : (ctx)=>const DetailsView()

        },

      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
// import 'package:news_online_adding_bloc/home_view.dart';
//
// import 'bloc_observer.dart';
//
// void main(  ) {
//   Bloc.observer = MyBlocObserver();
//   runApp(const NewsAppWithBloc() );
// }
// class NewsAppWithBloc extends StatelessWidget {
//   const NewsAppWithBloc({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (ctx)=> NewsCubit(),
//       child: MaterialApp(
//         home: HomeView(),
//       ),
//     );
//   }
// }
// //8c7bb29b0a0c41a7893c4b187cb3334a
