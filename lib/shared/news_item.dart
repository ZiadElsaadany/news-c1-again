import 'package:flutter/material.dart';

class ItemOfNews extends StatelessWidget {
  const ItemOfNews({Key? key, required this.image, required this.title, required this.publishedAt}) : super(key: key);

  final String image ;
  final String title;
  final String publishedAt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize:18,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(publishedAt,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold ,
                fontSize: 15
            ),

          )

        ],
      ),
    );
  }
}

