import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
   NewsWidget({Key? key,required this.data}) : super(key: key);
  List data;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx,index){
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height*0.15,
                    placeholder: 'assets/images/loadingPicture.jpg',
                    imageErrorBuilder: (c,b,v) {
                      return Image.asset('assets/images/loadingPicture.jpg');
                    },// image from asset
                    image: data[index]['urlToImage'] ?? ''
                  ),
                ),
              ) ,
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     data[index]['title'],
                      maxLines: 4 ,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 10,),
                    Text(
                      data[index]['publishedAt'],
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
              )
            ],
          ),
        ) ;
      },
      // data
      itemCount: data.length,
      separatorBuilder: (ctx,index) {
        return Divider(
          height: 1,
          thickness: 2,
          color: Colors.grey,
          indent: 40 ,
          endIndent:40 ,

        );
      } ,
    );
  }
}
