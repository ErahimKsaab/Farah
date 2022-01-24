import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {


  var content=[];
  var f;
  var Loading=false;
  Future getcontent()async {

    print('asdasd');

    setState(() {
      Loading=true;
    });
    try {
      http.Response response = await http.get('http://aliensxtech.com/api/allAboutApp');
      if (response.statusCode == 200||response.statusCode == 201) {
        setState(() {
          f= json.decode(response.body);
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
  List notfi=[{'message':"تم قبول حجزك","time":"الان"},{'message':"تم ارسال طلب حجزك","time":"10:30 م"},{'message':" احجز حجزك خدمتك الان و تمتع بخدمه مميزه من التطبيق","time":"9:30 م"}];
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(  
        backgroundColor: Colors.white,
        body:   Container(height: heigh,width: weidth,
          child: Padding(
            padding: EdgeInsets.all(heigh*0.010582).copyWith(left:  heigh*0.01322 *3,right: heigh*0.01322 *1),
            child: Column(    mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: heigh*0.01322*4,),
                Container(height: heigh*0.01322*5,width: weidth,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back,color: Colors.black,)),
                  Text('عن التطبيق', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                  Opacity(opacity: 0,child: Icon(Icons.arrow_forward,color: Colors.black,)),
                ],),),SizedBox(height: heigh*0.01322*2,),
                Text('عن التطبيق ', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
,SizedBox(height: heigh*0.01322 *3,),
                if(!Loading)  Text(f[0]['content'].toString(), style: TextStyle(color: Colors.grey,fontSize:  heigh*0.0132275*1.3 ,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
