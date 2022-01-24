import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:farah/Classes.dart';
import 'package:farah/MainPage.dart';
import 'package:farah/Ra2eseya.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:farah/ChooseLogin.dart';
import 'package:farah/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var sections;
  Future getSections()async {
    try {
      http.Response response = await http.get('http://aliensxtech.com/api/allSection');
      if (response.statusCode == 200||response.statusCode == 201) {
        setState(() {
          sections= json.decode(response.body);
        });
        var PROGILEINFO = Provider.of<pro>(context,listen: false);
        PROGILEINFO.section(sections);
        SharedPreferences pref = await SharedPreferences.getInstance();

        var ss=pref.get('kindofusers');
        if(ss=='provider'){
          print('kind is --------------------------------->provider');
          Navigator.push(context,  PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>Ra2esi(),transitionDuration: Duration(seconds: 1,),
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
        }else{
          Navigator.push(context,  PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>MainPage(),transitionDuration: Duration(seconds: 1,),
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
        }

      } else {
        print(response.statusCode);
        await Future.delayed(Duration(seconds:  1));

      }
    } catch (e) {
      print(e);

    }
  }
  var userinformation;
  Future getuserinformation(id) async {

    print('5');
    print('asdasd');
    //language();
    try {
      http.Response response =
      await http.get('http://aliensxtech.com/api/ServiceRequesterinformation/$id/$token');
      if (response.statusCode == 200) {
        print('asdasd');
        setState(() {
          userinformation = json.decode(response.body);
        });
        print(userinformation);
        if(userinformation['block']=='false'){
          var PROGILEINFO = Provider.of<pro>(context,listen: false);
          PROGILEINFO.Profile(userinformation );
          getSections();



        }else{
          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
            children: [
              CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor:  Color(0xFF202540),),
              SizedBox(width: 10,),
              Text('Failed !'),
            ],
          ),content: Text('Wait for the company to activate your account '),actions: [FlatButton(color: Color(0xFF202540),onPressed: (){
            Navigator.pop(context);
          }, child: Text('Close',style: TextStyle(color: Colors.white),))],),);

        }

      }else{
        print('asdasdasdads');
      }
    } catch (e) {
      print(e);
//      print(e);

      await Future.delayed(Duration(seconds: 1));

    }
  }
  Future getmokademinformation(id) async {

    print('5');
    print('asdasd');
    //language();
    try {
      http.Response response =
      await http.get('http://aliensxtech.com/api/ServiceProviderinformation/$id/$token');
      if (response.statusCode == 200) {
        print('asdasd');
        setState(() {
          userinformation = json.decode(response.body);
        });
        print(userinformation);
        if(userinformation['block']=='false'){
          var PROGILEINFO = Provider.of<pro>(context,listen: false);
          PROGILEINFO.Profile(userinformation);
          getSections();


        }else{
          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
            children: [
              CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor:  Color(0xFF202540),),
              SizedBox(width: 10,),
              Text('Failed !'),
            ],
          ),content: Text('Wait for the company to activate your account '),actions: [FlatButton(color: Color(0xFF202540),onPressed: (){
            Navigator.pop(context);
          }, child: Text('Close',style: TextStyle(color: Colors.white),))],),);

        }

      }else{
        print('asdasdasdads');
      }
    } catch (e) {
      print(e);
//      print(e);

      await Future.delayed(Duration(seconds: 1));

    }
  }
  shared()async{
    print('3');
    SharedPreferences pref = await SharedPreferences.getInstance();

    var ss=pref.get('kindofusers');
    var id=pref.get('userids');
    print('KIND OF USER ID-------=========================>$ss');
    if(ss=='requester'){
      await   getuserinformation(id);
    }else if(ss=='provider'){
      await getmokademinformation(id);
    }else{
      Timer(Duration(seconds: 3),()=>Navigator.push(context,  PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>Loginpage(),transitionDuration: Duration(seconds: 1,),
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
      )));
    }


  }
  @override
  var token;
  void initState() {

    FirebaseMessaging().getToken().then((value)async {
      print('ssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      print(value);
      if(value.isNotEmpty){
        shared();
        setState(() {
          token=value; });  }});



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    print(weidth);
    print(heigh);
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(fit: StackFit.expand,
       children: [
       FittedBox(
         child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.40.10 PM.jpeg'),
         fit: BoxFit.fill,
       ),
      // Image.asset('',fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
       Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             SizedBox(height:heigh*0.29100),
             DelayedDisplay(
               delay: Duration(seconds: 1),
               child:   Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.07 PM.png',width: heigh*0.396825,height: heigh*0.396825,),
             ),

           ],
         ),
       ),

       ],
      ),
    );
  }
}
