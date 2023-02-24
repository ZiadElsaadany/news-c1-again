









import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
import 'package:news_online_adding_bloc/home_view_body.dart';

import 'cubit/news_states.dart';

class HomeView extends StatefulWidget {
   const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    NewsCubit  cubit =  NewsCubit.getInstance(context) ;
    // Consumer<>
    return  BlocConsumer<NewsCubit, NewsStates>(
        builder: (context,state) {


          return   Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("News App"),
            ),

            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              currentIndex:cubit.currentIndexForScreens ,
              onTap: ( index) {
                cubit.changeIndex(index: index);

              },

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports) ,
                    label: "sports"
                ) ,
                BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: "business"
                ) ,
                BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_outlined),
                    label: "health"
                )
                ,
              ],
            ),

            body:const HomeViewBody() ,



          ) ;

        },
        listener: (context, state){ }
    ) ;


  }
}













// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
// import 'package:news_online_adding_bloc/cubit/news_states.dart';
//
// class HomeView extends StatefulWidget {
//    const HomeView({Key? key}) : super(key: key);
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<NewsCubit>(context).getNewsFromApi(category: "sports");
//   }
//   @override
//   Widget build(BuildContext context) {
//     NewsCubit cubit = NewsCubit.getInstance(context);
//     return BlocConsumer<NewsCubit, NewsStates>(
//       listener:(context, state) { } ,
//       builder: ( context , state){
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             title: const Text("News App"),
//             actions: [
//               IconButton(onPressed: ( ) { } , icon: const Icon(Icons.search))
//             ],
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             selectedItemColor: Colors.black,
//             unselectedItemColor: Colors.grey,
//
//             onTap: (index ) {
//       cubit.changeState(index: index);
//       cubit.getNewsFromApi(
//           category: cubit.currentIndex==0 ? "sports":
//               cubit.currentIndex==1? "business":
//                   "health"
//       );
//             } ,
//             currentIndex: cubit.currentIndex ,
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.sports),
//                   label:  "sports"
//               ),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.business),
//                   label: "Business"
//               ),
//               BottomNavigationBarItem(icon:Icon(Icons.health_and_safety_outlined),
//                   label: "Health"
//               ),
//             ],
//           ),
//
//
//           body: cubit.screens[ cubit.currentIndex],
//         );
//       },
//
//     );
//   }
// }
