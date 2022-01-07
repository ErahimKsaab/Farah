import 'package:farah/Loginpage.dart';
import 'package:farah/Signup1.dart';
import 'package:flutter/material.dart';
class chooseloginway extends StatefulWidget {
  @override
  _chooseloginwayState createState() => _chooseloginwayState();
}

class _chooseloginwayState extends State<chooseloginway> {
var check=0;
var kind='requester';
  @override
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(width: weidth,height: heigh,
        child: Column( mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: heigh*0.1190476,),
            Container(width: heigh*0.0132275*15,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
            SizedBox(height: heigh*0.039682,),
            Text('الرجاء اختيار نوع الحساب',style: TextStyle(fontSize: heigh*0.033068,fontFamily: 'Cairo'),),      SizedBox(height: heigh*0.052910,),
            InkWell(onTap: (){
              setState(() {
                check=0;
                kind='requester';
              });
            },
              child: Container(child: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.07 PM (1).jpeg'),
                  SizedBox(height: heigh*0.0132275,),
                  Text('طالب خدمه',style: TextStyle(fontSize: heigh*0.030423,fontFamily: 'Cairo'),)
                ],
              ),),width: heigh*0.43650,height: heigh*0.0132275*12,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border:Border.all(width: 2,color:check==1?Colors.grey.withOpacity(0.2):Color(0xFFffb800))),),
            ),
            SizedBox(height: heigh*0.0132275*2,),
            InkWell(onTap: (){
              setState(() {
                check=1;
                kind='provider';
              });
            },
              child: Container(child: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/mokadem.jpeg'),
                  SizedBox(height: heigh*0.0132275,),
                  Text('مقدم خدمه',style: TextStyle(fontSize: heigh*0.030423,fontFamily: 'Cairo'),)
                ],
              ),),width: weidth-30,height: heigh*0.0132275*12,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border:Border.all(width: 2,color:check==0?Colors.grey.withOpacity(0.2):Color(0xFFffb800))),),
            ),
            SizedBox(height: heigh*0.0132275*7,),
            SizedBox(width: heigh*0.43650,height: heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text('التسجيل' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.0330,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: ()=>
                Navigator.push(context,  PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>Signup1(kind: kind,),transitionDuration: Duration(seconds: 1,),
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
                )),color:Color(0xFFffb800))),
          ],
        ),
      ),
    );
  }
}
