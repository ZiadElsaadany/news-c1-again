import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_online_adding_bloc/view/home/home_view_body.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);


  static const String routeName = "details view";
  @override
  Widget build(BuildContext context) {


    var args = ModalRoute.of(context)!.settings.arguments   as DetailsModel  ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loadingPicture.jpg",
            image: args.image ,
            imageErrorBuilder: (e,c,r ) {

              return Image.asset ("assets/images/loadingPicture.jpg") ;
            },
          ),
          Text(args.title ,
          style: TextStyle(
            color: Colors.black,
            fontSize:  20 ,
            fontWeight: FontWeight.bold
          ),
          ),
          Text( args.publishedAt,
            style: TextStyle(
                color: Colors.black,
                fontSize:  15 ,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(args.desc  ,
            style: const TextStyle(
                color: Colors.black,
                fontSize:  15 ,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(args.content  ,
            style: const TextStyle(
                color: Colors.black,
                fontSize:  15 ,
                fontWeight: FontWeight.bold
            ),
          ),
          GestureDetector(
            onTap: ( ) async{
              if (await canLaunchUrl(Uri.parse(args.url))) {
                await launchUrl(Uri.parse(args.url));
              }
              else {
                // can't launch url, there is some error
                throw "Could not launch ${args.url}";
              }
            },
            child: const Text("View Full Article",
              style: TextStyle(
                  color: Colors.black,
                  fontSize:  15 ,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

        ],
      ),
    );
  }
}
