

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
import 'package:news_online_adding_bloc/cubit/news_states.dart';
import 'package:news_online_adding_bloc/shared/news_item.dart';

import '../details/details_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder:(context, state) {
          if(state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if( state is NewsFailureState) {
          return const Text( "حدثت مشكلة بالرجاء اعادة المحاولة");
          } else{

            return  ListView.builder(
                itemCount:BlocProvider.of<NewsCubit>(context).dataFromApi!.length ,

                itemBuilder: (ctx,index) {
              return  GestureDetector(

                onTap:  ( ) {
                  Navigator.pushNamed(context, DetailsView.routeName,
                  arguments: DetailsModel(
                    url:  BlocProvider.of<NewsCubit>(context).dataFromApi![index]["url"]??"" ,
                    title: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["title"]??"",
                    content: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["content"]??"" ,
                    desc: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["description"]??"" ,
                    image: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["urlToImage"]??"" ,
                    publishedAt:  BlocProvider.of<NewsCubit>(context).dataFromApi![index]["publishedAt"]??""
                  )
                  );
                },
                child: ItemOfNews(
                  title: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["title"]??"",
                  publishedAt: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["publishedAt"]??"",
                  image: BlocProvider.of<NewsCubit>(context).dataFromApi![index]["urlToImage"]??"",
                ),
              )  ;
            }) ;

          }

        }  ,
        listener:  ( context,satte) { }
    );
  }
}
class DetailsModel{
  final String image ;
  final String title ;
  final String desc ;
  final String content ;
  final String publishedAt ;
  final String url;
  DetailsModel(
  {
    required this.image,
   required  this.title,
   required  this.desc,
    required this.content,
    required this.publishedAt,
    required this.url
}
      );

}




















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
// import 'package:news_online_adding_bloc/cubit/news_states.dart';
//
// import 'shared/news_item.dart';
//
// class HomeViewBody extends StatelessWidget {
//   const HomeViewBody({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     NewsCubit cubit = NewsCubit.getInstance(context);
//     return  BlocConsumer<NewsCubit , NewsStates>(
//         builder: (ctx,state)   {
//    if(state is LoadingState) {
//      return const Center(child: CircularProgressIndicator());
//    }    else if( state is SuccessState) {
//      return ListView.builder(
//          itemBuilder:  ( ctx, index) {
//            return  ItemOfNews(
//              image: '${cubit.dataFromApi![index]["urlToImage"]}',
//              title: '${cubit.dataFromApi![index]["title"]}',
//              desc: '${cubit.dataFromApi![index]["description"]}',
//            );
//          }
//      );
//    } else  {
//      return const Center(child: Text("حدثت مشكلة ما بالرجاء اعادة المحاولة"));
//    }
//
//         },
//
//         listener: (ctx,state) { });
//   }
// }
