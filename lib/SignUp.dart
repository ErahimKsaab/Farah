import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:farah/AuthClass.dart';
import 'package:farah/ChooseLogin.dart';
import 'package:farah/Classes.dart';
import 'package:farah/ComonClass.dart';
import 'package:farah/MainPage.dart';
import 'package:farah/Signup1.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
class Loginpagemain extends StatefulWidget {
  @override
  _LoginpagemainState createState() => _LoginpagemainState();
}

class _LoginpagemainState extends State<Loginpagemain> {
  @override
  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
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
      } else {
        print(response.statusCode);
        await Future.delayed(Duration(seconds:  1));

      }
    } catch (e) {
      print(e);

    }
  }
  Future login() async {
    loadingDialog();
    try {
      FormData formData = new FormData.fromMap({
        "phonenum": "$pricode"+PhonenumberController.text.toString(),
        "password": PasswordController.text.toString(),
        'token':token
      });
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/loginforServiceRequester',
        data: formData,
      );
      if (response2.statusCode == 200) {
        getSections();
        print("aaaaaaaaaaaaaaaaaaaabyo");
        // successOrderDialog(response2.data);
        if(response2.data=='These credentials do not match our records.'){
          Navigator.pop(context);
          showDialog(context: context, builder: (context) =>
              Directionality(textDirection:TextDirection.rtl ,
                child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),title: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.clear, color: Colors.white,),
                      backgroundColor: Color(0xFFffb800),),
                    SizedBox(width: 10,),
                    Text(''),
                  ],
                ),
                  content: Text(' رقم الهاتف او الرقم السري الخاص بك خطأ',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
                  actions: [
                    FlatButton(
                        color: Color(0xFFffb800),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('اغلاق',
                          style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.black ),))
                  ],),
              ),);
        }else{
          print('doneeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
          _Loginphone(context,response2.data[0]['id'], response2.data[1].toString(),response2.data[0]);

        }
        print(response2.data);
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        //    prefs.setInt('userid',response2.data['id']);
        //       print(prefs.getInt('userid'));
        //   print(prefs.getString('kindofuser'));

      }
    } catch (e) {
      print(e);

    }
  }

  _Loginphone(BuildContext context,id,kind,info)async{

    final auth=Provider.of<Authbase>(context,listen: false);
    try{
      await auth.signupbyphone( "$pricode"+PhonenumberController.text.toString(), context,["$pricode"+PhonenumberController.text.toString(),id,kind,info],'login');
    }on PlatformException catch (e){
      print("gggggggggggggggggggggggg");
      print(e);
      Navigator.pop(context);
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
  var check=false;
  usedd USE=usedd();
  TextEditingController PhonenumberController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
String pricode='+966';
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        body: Container(width: weidth,height: heigh,
          child: SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:  heigh*0.0132275*9,),
                Container(width: heigh*0.0132275*13,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
                SizedBox(height: heigh*0.0132275*4,),
                Text('مرحبا بك في تطبيف فرحه',style: TextStyle(fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.0132275*2,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text('رقم الهاتف',style:  TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                  Directionality(textDirection:TextDirection.rtl ,
                    child: TextFormField( controller: PhonenumberController,keyboardType: TextInputType.phone,decoration: InputDecoration(suffixIcon:CountryCodePicker(enabled: true,initialSelection: 'SA',onChanged: (d){
                      FocusScope.of(context).unfocus();
                      print(d.name);  print(d.hashCode);print(d.flagUri);
                      print(d.code);   print(d.dialCode);
                      pricode=d.dialCode.toString();
                      print(pricode);
                    },
                      favorite: ['+966','SA'],
                      hideMainText: true,
                    ),border: InputBorder.none,hintText: 'XXXXXXX',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                  ),
                  Text('كلمه المرور',style:  TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                  Row(
                    children: [
                      Expanded(child: TextFormField ( controller: PasswordController, obscureText:!_obscureText,decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),)),
                      IconButton(icon: Icon(  _obscureText ? Icons.visibility
                          : Icons.visibility_off,color:Color(0xFFffb800)), onPressed:_toggle)
                    ],
                  ),

                ],),
              ),

                SizedBox(height: heigh*0.0132275*7,),
                SizedBox(width: heigh*0.0132275*33,height: heigh*0.0132275*6,child: RaisedButton(child: Center(child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back,color: Colors.white,size: heigh*0.0132275*4,),
                    Text(' تسجيل الدخول' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.03306,color: Colors.white ),),

                  ],
                ), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: ()async{
                  if(await USE.checkInternetConnectivity()){
                    if(PhonenumberController.text.length==0){
                      showDialog(context:context,builder: (context) => Directionality(textDirection:TextDirection.rtl ,
                        child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),title: Row(
                          children: [
                            CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:Color(0xFFffb800),),
                            SizedBox(width: 10,),
                            Text(''),
                          ],
                        ),content: Text('ادخل رقم الهاتف الخاص بك اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black )),actions: [FlatButton(color:   Color(0xFFffb800),onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('اغلاق',style: TextStyle(fontFamily: 'Cairo',fontSize: 13,color: Colors.black )))],),
                      ),);

                    }else if(PasswordController.text.length==0) {
                      showDialog(context: context, builder: (context) =>
                          Directionality(textDirection:TextDirection.rtl ,
                            child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),title: Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.clear, color: Colors.white,),
                                  backgroundColor: Color(0xFFffb800),),
                                SizedBox(width: 10,),
                                Text(''),
                              ],
                            ),
                              content: Text('ادخل الرقم السري الخاص بك اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
                              actions: [
                                FlatButton(
                                    color: Color(0xFFffb800),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('اغلاق',
                                        style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.black ),))
                              ],),
                          ),);
                    }else{
                      login();
                    }



                  }else{
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


                    },color:Color(0xFFffb800))),
                SizedBox(height: heigh*0.0132275*3),
                InkWell(onTap: ()=>Navigator.push(context,  PageRouteBuilder(
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
                )),child: Text('انشاء حساب جديد',style: TextStyle(fontSize: heigh*0.01984126,color:Colors.grey ,fontFamily: 'Cairo',),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
