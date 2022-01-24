
import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:farah/ComonClass.dart';
import 'package:farah/MainPage.dart';
import 'package:farah/Ra2eseya.dart';
import 'package:farah/Signup3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class otpsignup extends StatefulWidget {
  var verificationId,list,kind;
  otpsignup({this.verificationId,this.list,this.kind });
  @override
  _otpsignupState createState() => _otpsignupState();
}

class _otpsignupState extends State<otpsignup> {
  AnimationController animationController;
var token;
  void initState() {
    FirebaseMessaging().getToken().then((value)async {
      print('ssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      print(value);
      if(value.isNotEmpty){
        setState(() {
          token=value; });  }});
    super.initState();
  }
  final TextEditingController codecontroller = TextEditingController();
  usedd USE=usedd();
  Future Signuprequester() async {
    print('lind of sign up--------------------->Signuprequester');
    loadingDialog();
    try {
      print('1');
      var map;

      map = {
        "name": widget.list[7].toString(),
        'city':widget.list[4].toString(),
        'currency': widget.list[3].toString(),
        'phonenum':widget.list[0].toString(),
        'email': widget.list[6].toString(),
        'password':widget.list[5].toString(),
        'bank_account':widget.list[8].toString(),
        'token':token.toString(),
        'block':'false'
      };


      map.removeWhere((key, value) => key == null || value == null);
      FormData formData = new FormData.fromMap(map);
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/signupServiceRequester',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context);
        print(response2.data );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('userids',response2.data['id']);
        prefs.setString('kindofusers', widget.list[1]) ;
        print('kind is ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${widget.list[1]}');
        var PROGILEINFO = Provider.of<pro>(context,listen: false);
        PROGILEINFO.Profile(response2.data);
        //  print(prefs.getInt('userid'));
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
    } catch (e) {
      print(e);


    }
  }
  Future signupServiceProvider() async {
    print('lind of sign up--------------------->signupServiceProvider');
    loadingDialog();
    try {
      print('1');
      var map;

      map = {
        "name": widget.list[7].toString(),
        'city':widget.list[4].toString(),
        'currency': widget.list[3].toString(),
        'phonenum':widget.list[0].toString(),
        'email': widget.list[6].toString(),
        'password':widget.list[5].toString(),
        'token':token.toString(),
        'bank_account':widget.list[8].toString(),
        'block':'false'
      };


      map.removeWhere((key, value) => key == null || value == null);
      FormData formData = new FormData.fromMap(map);
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/signupServiceProvider',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context);
print(response2.data );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('userids',response2.data['id']);
        prefs.setString('kindofusers', widget.list[1]) ;
print('kind is ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${widget.list[1]}');
        var PROGILEINFO = Provider.of<pro>(context,listen: false);
        PROGILEINFO.Profile(response2.data);
        //  print(prefs.getInt('userid'));
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

        //  print(prefs.getInt('userid'));

      }
    } catch (e) {
      print(e);


    }
  }
  loadingDialog() {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(color: Colors.white38,
            height: 150.0,
            padding: EdgeInsets.all(height*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpinKitRing(
                  color:  Color(0xFFffb800),
                  lineWidth: 1.5,
                  size: 35.0,
                ),
                SizedBox(height: 20,),

                Text("انتظر قليلا", style: TextStyle(color: Color(0xFF202540),)),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    const EdgeInsets _marginEdgeInsetsforCard = EdgeInsets.only(
        left: 10,
        right: 2,
        top: 2,
        bottom: 2);
    return Scaffold(

      backgroundColor:Colors.white,body:SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 90,
                height: 90,
                child: Image.asset(
                  "assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(' تطبيف فرحه',style: TextStyle(fontSize:  20,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),      SizedBox(height: 20,),

              const SizedBox(
                height:30,
              ),
            ],
          ),
          Text(
              'ادخل الكود المرسل الي هاتفك',
              style:TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)
          ),
          const SizedBox(
            height:70,
          ),
          Column(
            children: <Widget>[
              Card(color: Colors.white70,
                elevation: 0.3,
                margin: const EdgeInsets.only(
                    left: 30, right: 30),
                child: Column(
                  children: <Widget>[

                    Container(
                      margin: _marginEdgeInsetsforCard,
                      child: TextField(
                        controller: codecontroller,
                        style: Theme.of(context).textTheme.button.copyWith(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:'*****',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.black),
                            icon: Icon(Icons.message,
                                color: Theme.of(context).iconTheme.color)),
                        // keyboardType: TextInputType.number,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left:20, right: 20),
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: ShapeDecoration(
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),

                    ),
                    child: Material(
                      color:Color(0xFFffb800),
                      type: MaterialType.card,
                      clipBehavior: Clip.antiAlias,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        onTap: ()async{
                          if(await USE.checkInternetConnectivity()){

                            if(codecontroller.text.length==0){
                              showDialog(context:context,builder: (context) =>    Directionality(textDirection:TextDirection.rtl ,
                                child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  title: Row(
                                    children: [
                                      CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor: Color(0xFFffb800),),
                                      SizedBox(width: 10,),
                                      Text('',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
                                    ],
                                  ),content: Text('ادخل الكود اولا' ,style: TextStyle(fontFamily: 'Cairo',fontSize:15,color: Colors.black ),),actions: [FlatButton(color: Color(0xFFffb800),onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('اغلاق',style: TextStyle(fontFamily: 'Cairo',fontSize:12,color: Colors.black),))],),
                              ),);

                            }else if(codecontroller.text.length<6) {
                              showDialog(context:context,builder: (context) =>    Directionality(textDirection:TextDirection.rtl ,
                                child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  title: Row(
                                    children: [
                                      CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor: Color(0xFFffb800),),
                                      SizedBox(width: 10,),
                                      Text('',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
                                    ],
                                  ),content: Text('ادخل الكود الصحيح' ,style: TextStyle(fontFamily: 'Cairo',fontSize:15,color: Colors.black ),),actions: [FlatButton(color: Color(0xFFffb800),onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('اغلاق',style: TextStyle(fontFamily: 'Cairo',fontSize:12,color: Colors.black),))],),
                              ),);

                            }else{
                              if(widget.kind=='Signup'){
                                AuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode:(codecontroller.text).toString()
                                );
                                final result = await FirebaseAuth.instance.signInWithCredential(credential).catchError((e){
                                  showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                                    children: [
                                      CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                      SizedBox(width: 10,),
                                      Text(''),
                                    ],
                                  ),content: Text(e.message.toString()),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                                    print('sad');
                                    Navigator.pop(context);
                                  }, child: Text('Close',style: TextStyle(color: Colors.white),))],),);
                                });
                                // var PROGILEINFO = Provider.of<pro>(context,listen: false);
                                print('5555555555555555555555555555555');
                                final user = result?.user;
                                if(user!=null) {
                                  if(widget.list[1]=='requester'){
                                    Signuprequester();
                                  }else{
                                    signupServiceProvider();
                                  }


                                  print('doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeessssssssssssssssssss');
                                }

                              }else if(widget.kind=='login'){
                                AuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode:(codecontroller.text).toString()
                                );
                                final result = await FirebaseAuth.instance.signInWithCredential(credential).catchError((e){
                                  showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                                    children: [
                                      CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                      SizedBox(width: 10,),
                                      Text(''),
                                    ],
                                  ),content: Text(e.message.toString()),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                                    print('sad');
                                    Navigator.pop(context);
                                  }, child: Text('Close',style: TextStyle(color: Colors.white),))],),);
                                });

                                final user = result?.user;
                                if(user!=null) {
                                print('KIND OF USER ID------->${widget.list[2]}');
                                      print(widget.list[0]);
                                print(widget.list[1]);
                                print(widget.list[2]);
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                     prefs.setInt('userids',widget.list[1]);
                                prefs.setString('kindofusers', widget.list[2]) ;
                                var cc=await prefs.getString('kindofusers');
                                print('KIND OF USER ID------->${cc}');
                                var PROGILEINFO = Provider.of<pro>(context,listen: false);
                                PROGILEINFO.Profile(widget.list[3]);
                                if(widget.list[2]=='provider'){
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

                                }


                              }


                            }

                          }
                          else{
                            showDialog(context:context,builder: (context) =>    Directionality(textDirection:TextDirection.rtl ,
                              child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                title: Row(
                                  children: [
                                    CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor: Color(0xFFffb800),),
                                    SizedBox(width: 10,),
                                    Text('',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
                                  ],
                                ),content: Text('لايوجد اتصال بالانترنت' ,style: TextStyle(fontFamily: 'Cairo',fontSize:15,color: Colors.black ),),actions: [FlatButton(color: Color(0xFFffb800),onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text('اغلاق',style: TextStyle(fontFamily: 'Cairo',fontSize:12,color: Colors.black),))],),
                            ),);
                          }

                        },
                        highlightColor:Colors.black,
                        child: Center(
                          child: Container(color: Color(0xFFffb800),height: 100,
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20),
                            child: Center(
                              child: Text(
                                'تم',
                                textAlign:TextAlign.center,
                                  style:TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 30,),
              //  InkWell(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>loginpage() ,)),child: Text('Already have Account ? Login',style: TextStyle(color: Colors.white),))
            ],
          ),


        ],
      ),
    ),
    );
  }
}
