import 'dart:io';

import 'package:farah/ChooseLogin.dart';
import 'package:farah/ComonClass.dart';
import 'package:farah/SignUp.dart';
import 'package:farah/Signup1.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  usedd USE=usedd();
  DateTime currentBackPressTime;
  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'اضغط مره اخري للخروج من التطبيق',
        backgroundColor:Color(0xFFffb800),
        textColor: Colors.white,
      );
      return false;
    } else {
      return true;
    }
  }
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return WillPopScope(onWillPop: ()async{
      bool backStatus = onWillPop();
      if (backStatus) {
        exit(0);
      }
      return false;
    },
      child: Scaffold(
        body: Container(width: weidth,height: heigh,
          child: Column( mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: heigh*0.0132275*9,),
              Container(width:  heigh*0.0132275*15,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
              SizedBox(height:  heigh*0.0132275*6,),
              Text('مرحبا بك',style: TextStyle(fontSize: heigh*0.046296,fontWeight: FontWeight.bold,fontFamily: 'Cairo',),),      SizedBox(height:  heigh*0.0132275*2,),
              Text(' اختر طريقه تسجيل الدخول المناسبه لك',style: TextStyle(fontSize: heigh*0.0251322,fontFamily: 'Cairo',),),
              SizedBox(height:  heigh*0.0132275*7,),
              Container(width:  heigh*0.43650,height:  heigh*0.0132275*6,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                SizedBox(width: heigh*0.20767,height: heigh*0.0132275*5,child: RaisedButton(child: Center(child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,),),onPressed: ()=>print('object'),color: Color(0xFF1DA1F2),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),))),
                SizedBox(width:  heigh*0.20767,height:  heigh*0.0132275*5,child: RaisedButton(child: Center(child: FaIcon(FontAwesomeIcons.facebook,color: Colors.white,),),onPressed: ()=>print('object'),color: Color(0xFF4267B2),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),) ,))
              ],),),
              SizedBox(height: heigh*0.0198,),
              SizedBox(width: heigh*0.43650,height:  heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text(' تسجيل الدخول' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.033,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: ()=>Navigator.push(context,  PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>Loginpagemain(),transitionDuration: Duration(seconds: 1,),
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
              SizedBox(height:  heigh*0.0132275*6,),
              InkWell(onTap: ()=>

                  Navigator.push(context,  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>chooseloginway(),transitionDuration: Duration(seconds: 1,),
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
                  )),child: Text('انشاء حساب جديد',style: TextStyle(fontSize: heigh*0.033,color:Color(0xFFffb800) ,fontFamily: 'Cairo',),))
            ],
          ),
        ),
      ),
    );
  }
}
