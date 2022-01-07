import 'dart:convert';

import 'package:farah/Classes.dart';
import 'package:farah/Drawer.dart';
import 'package:farah/Tafasylmotrep.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
class Resultoftasnif extends StatefulWidget {
  var id,name;
  Resultoftasnif({this.id,this.name});
  @override
  _ResultoftasnifState createState() => _ResultoftasnifState();
}

class _ResultoftasnifState extends State<Resultoftasnif> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var Loading=false;
  var content;
  Future getcontent()async {
    var profile = Provider.of<pro>(context,listen: false);
    print('asdasd');
    print(widget.id);
    setState(() {
      Loading=true;
    });
    try {
      http.Response response = await http.get('http://aliensxtech.com/api/ContentOfSections/${widget.id}');
      if (response.statusCode == 200||response.statusCode == 201) {
        setState(() {
          content= json.decode(response.body);
        });
        setState(() {
          Loading=false;
        });
print(content);
      } else {
        print(response.statusCode);
        await Future.delayed(Duration(seconds:  1));

      }
    } catch (e) {
      print(e);

    }
  }
  void initState() {

    getcontent();

    super.initState();
  }
  @override


  Widget build(BuildContext context) {

    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,appBar: AppBar(elevation: 0,backgroundColor: Colors.white,actions: [


      ],title: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM (1).jpeg',width: heigh*0.01322*6,height:heigh*0.01322*6,),centerTitle: true,leading: InkWell(onTap: (){
        _scaffoldKey.currentState.openDrawer();
      },child: Icon(Icons.search,color: Colors.black,size:  heigh*0.01322*3,)),),
        body: Container(height: heigh,width: weidth,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:   EdgeInsets.symmetric(horizontal:  heigh*0.01322*2,vertical:  heigh*0.01322),
                child: Text(widget.name,style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
              ),
              if(Loading==true)Expanded(
             child: ListView.builder(itemBuilder: (context, index) => InkWell(onTap: (){
//               Navigator.push(context,  PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) =>tafasilmotrep(),transitionDuration: Duration(seconds: 1,),
//                 transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                   const begin = Offset(1.0, 0.0);
//                   const end = Offset.zero;
//                   const curve = Curves.ease;
//
//                   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//                   return SlideTransition(
//                     position: animation.drive(tween),
//                     child: child,
//                   );
//                 },
//               ));
             },
               child:Shimmer.fromColors(
                 baseColor: Colors.white.withOpacity(0.2),
                 highlightColor: Colors.orange.withOpacity(0.1),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
                       children: [ Padding(
                         padding:  EdgeInsets.symmetric(horizontal: heigh*0.01322).copyWith(left: heigh*0.01984),
                         child: Container(child: Padding(
                           padding:  EdgeInsets.only(right: heigh*0.01984),
                           child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.center,children: [
                             Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                               Text(' ',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                               SizedBox(height: 25,),
                               Text(' ',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                             ],),
                             SizedBox(width:  heigh*0.01322*2,),
                             CircleAvatar(radius:  heigh*0.01322*4.4,backgroundColor: Colors.white,backgroundImage: ExactAssetImage('assets/التفاصيل.png'),),

                           ],),
                         ),decoration: BoxDecoration(    boxShadow: [
                           BoxShadow(
                             color: Colors.grey,
                             offset: Offset(0.0, 0.0), //(x,y)
                             blurRadius: 2.0,
                           ),
                         ],color: Colors.white,borderRadius: BorderRadius.circular(20)),height:  heigh*0.01322*11,),
                       ),


                       ]),
                 ),
               )
             ),),
           ),
           if(Loading==false)   Expanded(
                child: ListView.builder(itemCount:  content.length,itemBuilder: (context, index) => InkWell(onTap: (){
                  Navigator.push(context,  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>tafasilmotrep(content: content[index],),transitionDuration: Duration(seconds: 1,),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [ Padding(
                        padding:  EdgeInsets.symmetric(horizontal: heigh*0.01322).copyWith(left: heigh*0.01984),
                        child: Container(child: Padding(
                          padding:  EdgeInsets.only(right: heigh*0.01984),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.center,children: [
                            Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                              Text(content[index]['name'],style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                             SizedBox(height: 25,),
                              Text('تبداء من',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                            ],),
                            SizedBox(width:  heigh*0.01322*2,),
                            CircleAvatar(radius:  heigh*0.01322*4.4,backgroundColor: Colors.white,    child:  ClipOval(

                              child: Image.network(content[index]['image'],fit: BoxFit.fill,  width: 120.0,
                                height: 120.0,
                                loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ?
                                      loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),),

                          ],),
                        ),decoration: BoxDecoration(    boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],color: Colors.white,borderRadius: BorderRadius.circular(20)),height:  heigh*0.01322*11,),
                      ),
                        Positioned(top: heigh*0.01984,left:  heigh*0.01322*2,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(content[index]['rate'],style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                          if(int.parse(content[index]['rate'])==5)    Row(
                                children: [
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                ],
                              ),
                              if(int.parse(content[index]['rate'])==4)    Row(
                                children: [
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                ],
                              ),
                              if(int.parse(content[index]['rate'])==3)    Row(
                                children: [
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                ],
                              ),
                              if(int.parse(content[index]['rate'])==2)    Row(
                                children: [
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                ],
                              ),
                              if(int.parse(content[index]['rate'])==1)    Row(
                                children: [
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                ],
                              ),

                              if(int.parse(content[index]['rate'])==0)
                                Row(
                                children: [
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                  Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(bottom: heigh*0.01984,
                          child: Container(width: heigh*0.42328,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: Center(child: Directionality(textDirection:TextDirection.ltr ,child: Text('${content[index]['price']} ريال' ,style: TextStyle(color: Colors.white,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))),),height:40,width:100,decoration:BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(10)),),

                              ],
                            ),
                          ),
                        )
                      ]),
                  ),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);