import 'package:flutter/material.dart';
import 'package:news_c1/view/business/business_screen.dart';
import 'package:news_c1/view/sciences/science_screen.dart';
import 'package:news_c1/view/search/search_screen.dart';
import 'package:news_c1/view/sports/sports_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
title: Text('New App '),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: ( ctx) {
                return SearchScreen();
              } ));
            }, icon: Icon (Icons.search ) ),
            IconButton(onPressed: (){}, icon: Icon(Icons.lightbulb_outline)),
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Business', icon: Icon(Icons.add_business),),
              Tab(text: 'Sports',icon: Icon(Icons.sports),),
              Tab(text: 'Sciences', icon: Icon(Icons.science),),
            ],
          ) ,
        ),
        body: TabBarView(
          children: [
            BusinessScreen(),
            SportsScreen(),
            ScienceScreen()
          ],
        ),
      ),
    );
  }
}
