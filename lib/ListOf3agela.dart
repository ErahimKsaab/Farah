import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';
class ListOf3agela extends StatefulWidget {
  var content;
  ListOf3agela({this.content});
  @override
  _ListOf3agelaState createState() => _ListOf3agelaState();
}

class _ListOf3agelaState extends State<ListOf3agela> {
  var moment = new Moment.now();
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Directionality(textDirection:TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
        body:   Container(width: w,height: h,
          child: ListView.builder(itemCount: widget.content.length,physics: BouncingScrollPhysics(),itemBuilder: (context, index)
          {

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 20),
              child: Container(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Padding(
                    padding:  EdgeInsets.only(top: h*0.0132275/2,right:  h*0.0132275/2),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('نوع الحجز', style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                        ,  Text(widget.content[index]['Booking_kind'].toString(), style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.6,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                        ,SizedBox(height: 10,),
                        Text('اقصي ميزانيه'.toString(), style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                        ,  Text(widget.content[index]['max_budget'] .toString(), style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.6,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
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
                        ,  Text(widget.content[index]['State']=='new'?"قيد الانتظار":widget.content[index]['State']=='accepted'?"تم القبول":widget.content[index]['State']=='refused '?"مرفوض":"انتهي الحجز",style: TextStyle(color: Colors.green,fontSize:  h*0.0132275*1.6,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                        ,SizedBox(height: h*0.0132275,),
                        Text('وقت وتاريح الحجز', style: TextStyle(color: Colors.grey,fontSize:  h*0.0132275*1.4,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
                        ,  Row(
                          children: [
                            Text( widget.content[index]['time'], style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.3,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                            SizedBox(width: h*0.0132275,),

                            Text( widget.content[index]['history'], style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.3,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                          ],
                        )
                        ,SizedBox(height: h*0.0132275/2,),
                      ],
                    ),
                  ),
                  Column(
                    children: [  Icon(Icons.star,color: Colors.orange,),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(moment.from(DateTime.tryParse(widget.content[index]['created_at'])),style: TextStyle(fontSize: 10),),
                      ),
                    ],
                  )
                ],),
              ),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border:  Border.all(color: Colors.black87.withOpacity(0.45)) ),),
            );
          }
//                if(content[index]['urgent']=='0'){

//                }else{

            //   }



          ),
        ),
      ),
    );
  }
}
