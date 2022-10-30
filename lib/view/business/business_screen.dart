
import 'package:flutter/material.dart';
import 'package:news_c1/provider/news_provider.dart';
import 'package:provider/provider.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Provider.of<NewsProvider>(context,listen: false).getDataFromApi(categoryName:'business');
  }
  Widget build(BuildContext context) {
    return Provider.of<NewsProvider>(context).loading == true?
      const Center(child: CircularProgressIndicator()):
      ListView.separated(
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
                      image:
                      Provider.of<NewsProvider>(context).data[index]['urlToImage']??'' ,
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
                        Provider.of<NewsProvider>(context).data[index]['title']??'',
                      maxLines: 4 ,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 10,),
                      Text(
                      Provider.of<NewsProvider>(context).data[index]['"publishedAt']??'',
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
      itemCount:  Provider.of<NewsProvider>(context).data.length,
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
