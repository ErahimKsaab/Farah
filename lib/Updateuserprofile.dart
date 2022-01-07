import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:farah/ComonClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController Namecontroller=TextEditingController();
  TextEditingController citycontroller=TextEditingController();
  TextEditingController currencycontroller=TextEditingController();
  TextEditingController Emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController Phonecontroller=TextEditingController();

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


  Future upload() async {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);

    loadingDialog();
    try {

      var map;

        print('hh');
        map = {
          "id":PROGILEINFO.information['id'],
          "name": Namecontroller.text.toString(),
          "phonenum":  Phonecontroller.text.toString(),
          "email":Emailcontroller.text.toString(),
          "password":passwordcontroller.text.toString(),
          'city':citycontroller.text.toString(),
          "currency":currencycontroller.text.toString()
        };


      map.removeWhere((key, value) => key == null || value == null);
      FormData formData = new FormData.fromMap(map);
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/updateServiceProvider',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context);
        print(response2.data);
        print('dddddddddddooooneeeeeeeeeeeeeeeeeeeee');
        //  successOrderDialog(response2.data);
        Navigator.pop(context);
        PROGILEINFO.Profile(response2.data);
        print(response2.data);
        Fluttertoast.showToast(
          msg:  "نجح اتعديل",
          backgroundColor: Color(0xFF202540),
          textColor: Colors.white,
        );
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setInt('driverid',response2.data['id']);

        //      print(prefs.getInt('driverid'));

      }
    } catch (e) {
      print(e);


    }
  }
  @override
  void initState() {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);
    setState(() {
      Namecontroller.text=PROGILEINFO.information['name'];
      Emailcontroller.text=PROGILEINFO.information['email'];
      passwordcontroller.text=PROGILEINFO.information['password'];
      citycontroller.text=PROGILEINFO.information['city'];

      currencycontroller.text=PROGILEINFO.information['currency'];


      Phonecontroller.text=PROGILEINFO.information['phonenum'];
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  usedd USE=usedd();
  Widget build(BuildContext context) {
    var PROGILEINFO = Provider.of<pro>(context,listen: true);

    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFffb800),centerTitle: false,title:Text( 'تعديل الملف الشخصي',style: TextStyle(fontSize: 20),)),
        body: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
          child:Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("الاسم",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(controller: Namecontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text( "البريد الالكتروني",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(controller: Emailcontroller,decoration: InputDecoration(   border: InputBorder.none,hintText:''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text( "رقم الهاتف",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(controller: Phonecontroller,decoration: InputDecoration(   border: InputBorder.none,hintText:''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("المدينه",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(maxLines:null ,controller: citycontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("الرقم السري",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(obscureText: true,controller: passwordcontroller,decoration: InputDecoration(    border: InputBorder.none,hintText:  ''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),
                  SizedBox(height: 20,),
                  Center(
                    child: SizedBox(height: 50,child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed:()async{

                      if(await USE.checkInternetConnectivity()){
                        if(Namecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text("ادخل الاسم الخاص بك"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                        }
                        else if(Phonecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text( "ادخل رقم الهاتف الخاص بك"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);

                        }else if(Emailcontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text("ادخل البريد الالكتروني"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                        }else if(!USE.checkEmailFormat(Emailcontroller.text.trim())){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text("ادخل البريد الالكتروني الصحيح"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                        }else if(Phonecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor: Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text( "ادخل الرقم السري"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color:Colors.white),))],),);
                        }else{
                          upload();
                          /// checksignup(context);
                        }

                      }
                      else{
                        showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                          children: [
                            CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor:  Color(0xFF202540),),
                            SizedBox(width: 10,),
                            Text( "فشلت العمليه"),
                          ],
                        ),content: Text( "تحقق من الاتصال نت الانترنت"),actions: [FlatButton(color: Color(0xFF202540),onPressed: (){
                          Navigator.pop(context);
                        }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                      }

                    },color:Color(0xFFffb800) ,child: Center(child: Text( "تعديل",style: TextStyle(color: Colors.white),),),)),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ) ,),
      ),
    );
  }
}
