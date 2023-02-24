import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_online_adding_bloc/cubit/news_cubit.dart';
import 'package:news_online_adding_bloc/cubit/news_states.dart';
import 'package:news_online_adding_bloc/shared/news_item.dart';


class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);


  static const String routeName = "search_view";



  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {


  final TextEditingController  _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text("Search For News"),
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            children: [


              TextFormField(
                // moh


                controller:_controller ,
                onChanged: (value )  {
                  BlocProvider.of<NewsCubit>(context).getDataFromSearch(searchKey: value);

                } ,

                cursorColor: Colors.green,
                decoration: InputDecoration(

                  suffixIcon: IconButton(
                    onPressed: ( )  {

                      BlocProvider.of<NewsCubit>(context).clearSearch();
                      _controller.text="";

                    } ,
                      icon: const Icon(Icons.clear),
                  ),
                  hintText: "search for news",
                  border: customOutlineInputBorder(color: Colors.grey),
                  enabledBorder:  customOutlineInputBorder(color: Colors.grey),
                  focusedBorder: customOutlineInputBorder(color: Colors.green)
                ),
              ),

              BlocConsumer<NewsCubit , NewsStates >(
                  builder:(context,state) {

                    if(state is SearchLoadingState){
                      return const CircularProgressIndicator(color: Colors.green,);
                    }
                    else if(state is SearchSuccessState) {
                  return     Expanded(
                        child: ListView.builder(itemBuilder: (ctx ,index) {
                          return  ItemOfNews(
                              image: BlocProvider.of<NewsCubit>(context).dataFromSearchList[index]["urlToImage"]??"",
                              title: BlocProvider.of<NewsCubit>(context).dataFromSearchList[index]["title"]??"",
                              publishedAt: BlocProvider.of<NewsCubit>(context).dataFromSearchList[index]["publishedAt"]??""
                          );
                        }),
                      );
                    }else if(state is SearchFailureState) {
                      return const Expanded(child: Center(child: Text("حصلت مشكلة")));
                    }else {
                      return const Expanded(
                        child: Center(
                          child: Text("Search Now",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                          ),
                        ),
                      );
                    }
                  } ,

                  listener: (context,state) { })


] ),
      ) );

  }

}
customOutlineInputBorder({ required Color color} ){
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
          color: color
      )
  ) ;
}










/*
   TextFormField(
                controller: _controller,
                //
                onChanged:(value ) {

                 if(  _controller.text !="") {
                   BlocProvider.of<NewsCubit>(context).searchFromApi(
                       searchKey: value);
                 }else{
                   BlocProvider.of<NewsCubit>(context).clearDataFromSearch();
                   _controller.text= "";
                 }
                  } ,
                //
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: ( ){
                      BlocProvider.of<NewsCubit>(context).clearDataFromSearch();
                      _controller.text= "";
                    },
                    icon: Icon(Icons.clear),
                  ),
                    hintText: "search for news",
                    enabledBorder:customOutlineInputBorder(),
                    border:customOutlineInputBorder(),
                    focusedBorder: customOutlineInputBorder()
                ),
              ),




              BlocConsumer<NewsCubit,NewsStates>(builder:  (  context,state ) {
                if(state is SearchLoadingState) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                }
                else if(state is GetSearchDataState) {
                  return
                    Expanded(
                    child: ListView.builder(
                      itemCount:BlocProvider.of<NewsCubit>(context).dataFromSearch!.length ,
                      itemBuilder: ( ctx ,index) {
                        return ItemOfNews(
                            image: BlocProvider.of<NewsCubit>(context).dataFromSearch![index]["image"]??"",
                            title: BlocProvider.of<NewsCubit>(context).dataFromSearch![index]["title"]??"",
                            publishedAt: BlocProvider.of<NewsCubit>(context).dataFromSearch![index]["publishedAt"]??""
                        );
                      },

                    ),
                  );
                }
                else if(state is FailureSearchState){
                  return const Text(
                    "TRY AGAIN",
                  style: TextStyle   (
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 25
                  ),
                  );
                } else{
                  return  const Expanded(
                    child: Center(
                      child: Text( "Search Now ",
                        style: TextStyle   (
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 25
                        ),

                      ),
                    ),
                  );
                }

              }, listener: (context,state){ })
*/