import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
import 'package:news_online_adding_bloc/home_view.dart';

import 'bloc_observer.dart';

void main(  ) {
  Bloc.observer = MyBlocObserver();
  runApp(const NewsAppWithBloc() );
}
class NewsAppWithBloc extends StatelessWidget {
  const NewsAppWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx)=> NewsCubit(),
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
