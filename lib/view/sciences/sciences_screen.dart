import 'package:flutter/material.dart';
import 'package:news_c1/provider/news_provider.dart';
import 'package:provider/provider.dart';
class SciencesScreen extends StatefulWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  State<SciencesScreen> createState() => _SciencesScreenState();
}

class _SciencesScreenState extends State<SciencesScreen> {
  initState( ) {
    super.initState();
    Provider.of<NewsProvider>(context,listen:false).getNews(categoryName: 'science');
  }

  Widget build(BuildContext context) {
    return  Provider.of<NewsProvider>(context).loading==true?
    Center(
      child: CircularProgressIndicator(),
    ):
    ListView.separated(
      itemBuilder: (ctx,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                    ),
                    clipBehavior: Clip.antiAlias,
                    child: FadeInImage.assetNetwork(
                      height:130 ,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loadingPicture.jpg',
                      image:    Provider.of<NewsProvider>(context).data[index]['urlToImage']??'',
                      imageErrorBuilder: (c,v,b )  {
                        return Image.asset('assets/images/loadingPicture.jpg');
                      },
                    )
                ),
              ),
              SizedBox( width: 10,) ,
              Expanded(
                flex: 4,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${
                            Provider.of<NewsProvider>(context).data[index]['title']??''
                        }',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 10,),
                      Text( '${
                          Provider.of<NewsProvider>(context).data[index]['publishedAt']??''
                      }',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),)
                    ]

                ),
              )
            ],
          ),
        );
      },
      itemCount:
      Provider.of<NewsProvider>(context).data.length
      ,
      separatorBuilder: (ctx,index){
        return Divider(
          height: 1,
          thickness: 1.5,
          endIndent: 40,
          indent: 40,
          color: Colors.grey,
        );
      },
    );
  }
}
