import 'package:flutter/material.dart';
import 'package:news_c1/view/sciences/sciences_screen.dart';
import 'package:news_c1/view/sports/sports_screen.dart';

import '../business/business_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          // elevation: 0,
          title: Text('News App ' ,style: TextStyle(
            color: Colors.white
          ),),
          actions: [
            IconButton(
              onPressed: ( ) { } ,
              icon: Icon(Icons.search,color: Colors.black,),
            ),
            IconButton(
              onPressed: ( ) { } ,
              icon: Icon(Icons.lightbulb_outline,color: Colors.black,),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [

             Tab(text: 'Business', icon:Icon(  Icons.add_business) ),
             Tab(text: 'Sports', icon: Icon(Icons.sports),),
             Tab(text: 'Sciences',icon: Icon(Icons.science),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BusinessScreen(),
            SportsScreen(),
            SciencesScreen(),
          ],
        ),

      ),
    );
  }
}
