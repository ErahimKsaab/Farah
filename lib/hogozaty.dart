import 'dart:convert';

import 'package:farah/Classes.dart';
import 'package:farah/ListOf3agela.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_moment/simple_moment.dart';
class hogozat extends StatefulWidget {
  @override
  _hogozatState createState() => _hogozatState();
}

class _hogozatState extends State<hogozat> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var Loading=false;
  var content=[],contentss=[];
  var f;
  Future getcontent()async {
    var profile = Provider.of<pro>(context,listen: false);
    print(profile.information['id']);
    print('asdasd');

    setState(() {
      Loading=true;
    });
    try {
      http.Response response = await http.get('http://aliensxtech.com/api/Bookingorderforservesreqyesters/${profile.information['id']}');
      if (response.statusCode == 200||response.statusCode == 201) {
        setState(() {
      f= json.decode(response.body);
        });
        content=json.decode(response.body)[0];
        contentss=json.decode(response.body)[1];
//        for(int i=0;i<json.decode(response.body)[1].length;i++){
//          contentss.add(json.decode(response.body)[1][i]);
//      }
        print(content.length);

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


  var moment = new Moment.now();

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    final width=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      body: Container(height:h ,width:w ,child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: h*0.0132275*2),
        child: Column(
          children: [

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    InkWell(onTap: (){
    Navigator.pop(context);},child: Icon(Icons.arrow_back,color: Colors.black,)),

              Text('حجوزاتي', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
              Opacity(opacity: 0,child: Icon(Icons.arrow_back,color: Colors.black,)),
            ],),
            SizedBox(height: h*0.0132275*2,),
            if(Loading==true)Expanded(
              child: ListView.builder(itemBuilder: (context, index) =>


                  InkWell(onTap: (){
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
              ),


              ),
            ),
            if(Loading==false)Container(height: 600,width: width,
              child: Column(
                children: [
      InkWell(onTap:(){
Navigator.push(context, MaterialPageRoute(builder: (context) => ListOf3agela(content:contentss ,),));
    },
        child: Container( width: width,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border:  Border.all(color: Colors.black87.withOpacity(0.45)) ),child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(contentss.length.toString()),
                  Text('   الحجوزات العاجله'),

                ],
              ),

              Icon(Icons.star,color: Colors.orange,),

            ],
          ),
        ),),
      ),
                  Expanded(child: ListView.builder(itemCount: content.length,physics: BouncingScrollPhysics(),itemBuilder: (context, index)


                    {
//if(index==0){
//
//}else {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7,),
    child: Container(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,children: [
        Padding(
          padding:  EdgeInsets.only(top: h*0.0132275/2,right:  h*0.0132275/2),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('نوع الحجز', style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,  Text(content[index]['Booking_kind'], style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.6,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,SizedBox(height: 10,),
                    Text(content[index]['Sectionsformation'][0]['name'], style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,  Text(content[index]['contentformation'][0]['name'], style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.6,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,SizedBox(height: h*0.0132275/2,),
                  ],
          ),
        ),
        SizedBox(width: h*0.0132275*2,),
        Padding(
          padding:  EdgeInsets.only(top: h*0.0132275/2),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('حاله الحجز', style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,  Text(content[index]['State']=='new'?"قيد الانتظار":"تم القبول",style: TextStyle(color: Colors.green,fontSize:  h*0.0132275*1.6,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,SizedBox(height: h*0.0132275,),
                    Text('وقت وتاريح الحجز', style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                    ,  Row(
                      children: [
                        Text( content[index]['time'], style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.3,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                        SizedBox(width: h*0.0132275,),

                        Text( content[index]['history'], style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.3,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                      ],
                    )
                    ,SizedBox(height: h*0.0132275/2,),
                  ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: 50,child: Text(moment.from(DateTime.tryParse(content[index]['created_at'])),style: TextStyle(fontSize: 10),)),
        ),
      ],),
    ),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border:  Border.all(color: Colors.black87.withOpacity(0.45)) ),),
  );
}
//                if(content[index]['urgent']=='0'){

//                }else{

                   //   }



                  )),
                ],
              ),
            )
          ],
        ),
      ),),
      ),
    );
  }
}
