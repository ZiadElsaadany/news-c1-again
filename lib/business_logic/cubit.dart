import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashim_news/business_logic/states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitialAppState());

  static NewsCubit getInstance(BuildContext context){
    return BlocProvider.of(context);
  }
  int counter = 0;
  void incrementNumber(){
    counter++;
    emit(IncrementState());
  }

  void decrementNumber(){
    counter--;
    emit(DecrementState());
  }

}