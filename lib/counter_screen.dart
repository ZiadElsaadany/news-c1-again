import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashim_news/business_logic/cubit.dart';

import 'business_logic/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.getInstance(context);
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state)
      {

      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(title: Text("Counter App"),),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: ()
                  {
                    cubit.decrementNumber();
                  },
                  child: Text("-",style: TextStyle(fontSize: 25),),
                ),
                Text("${cubit.counter}",style: TextStyle(fontSize: 25),),
                InkWell(
                  onTap: ()
                  {
                    cubit.incrementNumber();
                  },
                  child: Text("+",style: TextStyle(fontSize: 25),),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
