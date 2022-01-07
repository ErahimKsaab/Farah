import 'package:flutter/material.dart';
class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  List notfi=[{'message':"تم قبول حجزك","time":"الان"},{'message':"تم ارسال طلب حجزك","time":"10:30 م"},{'message':" احجز حجزك خدمتك الان و تمتع بخدمه مميزه من التطبيق","time":"9:30 م"}];
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:   Container(height: heigh,width: weidth,
          child: Column(    mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: heigh*0.01322*4,),
              Padding(
                padding:   EdgeInsets.all(heigh*0.010582),
                child: Container(height: heigh*0.01322*5,width: weidth,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back,color: Colors.black,)),
                  Text('الاشعارات', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                  Opacity(opacity: 0,child: Icon(Icons.arrow_forward,color: Colors.black,)),
                ],),),
              ),

              Expanded (
                child: ListView.builder(

                    shrinkWrap: true,
                    itemCount:notfi.length,
                    itemBuilder: (context,index){
                      return   Padding(
                        padding:   EdgeInsets.symmetric(horizontal: heigh*0.010582*2,vertical: heigh*0.010582 ),
                        child: Container(child: Padding(
                          padding:   EdgeInsets.all(heigh*0.010582).copyWith(top: heigh*0.01322*2,bottom: heigh*0.01322*2),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Container(width: heigh*0.29100,child: Text(notfi[index]['message'], style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))),Text(notfi[index]['time']),
                          ],),
                        ),decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Color(0xFFffb800),width: 1)),),
                      );
                    }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
