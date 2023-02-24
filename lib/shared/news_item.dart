import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemOfNews extends StatelessWidget {
  const ItemOfNews({Key? key, required this.image, required this.title, required this.desc}) : super(key: key);

  final String image ;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(20) ,
          color: Colors.black
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              placeholder: "assets/images/loadingPicture.jpg",
              image: image,

            imageErrorBuilder: (e,c,r ) {

                return Image.asset ("assets/images/loadingPicture.jpg") ;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(title,
            style: const TextStyle(
                fontSize:25,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(desc,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold ,
                fontSize: 25
            ),

          )

        ],
      ),
    );
  }
}
