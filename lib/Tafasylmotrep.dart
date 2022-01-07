import 'package:farah/hagzzz.dart';
import 'package:flutter/material.dart';
class tafasilmotrep extends StatefulWidget {
  var content;
  tafasilmotrep({this.content});
  @override
  _tafasilmotrepState createState() => _tafasilmotrepState();
}

class _tafasilmotrepState extends State<tafasilmotrep> {
  var rhythm;
  @override
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.white,centerTitle: true,title: Text('التفاصيل', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),),
        //1
        body: Stack(children: [
          Container(height: heigh*0.43650,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.content['image']),fit: BoxFit.fill)),width: weidth,),
          Align(alignment: Alignment.bottomCenter,child: Container(child: Padding(
            padding:  EdgeInsets.symmetric(vertical: heigh*0.01322,horizontal: heigh*0.01984),
            child: SingleChildScrollView(physics: BouncingScrollPhysics(),
              child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('اسم مقدم الخدمه',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                  SizedBox(height: heigh*0.01322,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.content['name'],style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(int.parse(widget.content['rate'])==5)    Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                            ],
                          ),
                          if(int.parse(widget.content['rate'])==4)    Row(
                            children: [
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                            ],
                          ),
                          if(int.parse(widget.content['rate'])==3)    Row(
                            children: [
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                            ],
                          ),
                          if(int.parse(widget.content['rate'])==2)    Row(
                            children: [
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                            ],
                          ),
                          if(int.parse(widget.content['rate'])==1)    Row(
                            children: [
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                              Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                            ],
                          ),

                          if(int.parse(widget.content['rate'])==0)
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,)
                              ],
                            ),                          Text('  ${widget.content['rate']}    (${widget.content['people_rate']})  تقييم  ',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: heigh*0.01984,),
                  Text(widget.content['description'],style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                  SizedBox(height: heigh*0.01984,),
                  Text('الباقات',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                  SizedBox(height: heigh*0.01322,),
//                  Row(
//                    children: [
//                      Row(
//                        children: [
//                          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.orange,),child: Icon(Icons.crop_square,color: Colors.orange,)),
//                          SizedBox(width:heigh*0.01322/2 ,),
//                          Text('بأيقاع',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.9,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
//
//                        ],
//                      ),
//                      SizedBox(width:heigh*0.01984,),
//                      Row(
//                        children: [
//                          Icon(Icons.crop_square),
//                          SizedBox(width: heigh*0.01322/2,),
//                          Text(' بدون أيقاع',style: TextStyle(color: Colors.grey,fontSize:  heigh*0.0132275*1.9,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
//                        ],
//                      )
//                    ],
//                  ),
                  SizedBox(height: heigh*0.01322*2,),
                  Container(width: heigh*0.423,height: heigh*0.01322*12,
                    child: ListView.builder( physics: BouncingScrollPhysics(),

                        shrinkWrap: true,scrollDirection: Axis.horizontal,
                        itemCount:widget.content['booking'].length,
                        itemBuilder: (context,index){
                          return  Padding(
                            padding:   EdgeInsets.symmetric(horizontal: heigh*0.01322),
                            child: Container(child: Column(
                              children: [
                                Text('حفله افتتاح',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),  SizedBox(height: heigh*0.01322,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${widget.content['booking'][index]['hours']} ساعه',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)), Text('${widget.content['booking'][index]['price']} ريال',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                                  ],
                                ),
                                SizedBox(height: heigh*0.01322,),
                                RaisedButton(onPressed:(){
                                  Navigator.push(context,  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) =>HAGZ(bookingid: widget.content['booking'][index]['id'],conternt : widget.content,),transitionDuration: Duration(seconds: 1,),
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
                                },color: Colors.amber,child: Text('حجز',style: TextStyle(color: Colors.white,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),),

                              ],
                            ),height: heigh*0.01322*12,width: heigh*0.01322*13,color: Colors.amber.withOpacity(0.2),),
                          );
                        }),
                  ),
                  SizedBox(height: heigh*0.01322*2,),
                ],
              ),
            ),
          ),height: heigh*0.01322*45,width:weidth,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),),))
        ],)
      ),
    );
  }
}
