import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:farah/MainPage.dart';
import 'package:farah/Signup1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
  String pricode='+966';
  Future Contact() async {
    var profile = Provider.of<pro>(context,listen: false);
    print(profile.information['id']);
    loadingDialog();
    try {
      FormData formData = new FormData.fromMap({
       "sender_id": profile.information['id'],
        "name": name.text.toString(),
        "email": email.text.toString(),
        'phone': "$pricode"+phone.text.toString(),
        'report':report.text.toString(),
        'kind':"service_requester"

      });
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/addReports',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context);
        Fluttertoast.showToast(gravity: ToastGravity.BOTTOM,
          msg: "تم ارسال رسالتك بنجاح",
          backgroundColor:Colors.black,
          textColor: Colors.white,
        );
        Navigator.pop(context);
        print(response2.data);

      }
    } catch (e) {
      print(e);

    }
  }
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();

  TextEditingController report=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:   Container(height: heigh,width: weidth,
          child: SingleChildScrollView(
            child: Column(    mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: heigh*0.01322*4,),
                Padding(
                  padding:   EdgeInsets.all(heigh*0.010582),
                  child: Container(height: heigh*0.01322*5,width: weidth,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    InkWell(onTap: (){
                      Navigator.pop(context);
                    },child: Icon(Icons.arrow_back,color: Colors.black,)),
                    Text('اتصل بنا', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                    Opacity(opacity: 0,child: Icon(Icons.arrow_forward,color: Colors.black,)),
                  ],),),
                ),
                Text('مرحبا بك', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*4,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),

                Text('نسعد بأستقبال ارائكم وأقتراحاتكم', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),

                Padding(
                      padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: TextFormField ( controller: name, decoration: InputDecoration(border: InputBorder.none,hintText: 'اسم المستخدم',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: TextFormField (controller:email,  decoration: InputDecoration(border: InputBorder.none,hintText: 'البريد الالكتروني',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: TextFormField (controller: report,  decoration: InputDecoration(border: InputBorder.none,hintText: 'نص الرساله عنا',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: Directionality(textDirection:TextDirection.ltr ,
                    child: TextFormField(controller: phone,keyboardType: TextInputType.phone,decoration: InputDecoration( prefixIcon:CountryCodePicker(enabled: true,initialSelection: 'SA',onChanged: (d){
                      FocusScope.of(context).unfocus();
                      pricode=d.dialCode.toString();
                      print(d.name);  print(d.hashCode);print(d.flagUri);
                    },
                      favorite: ['+966','SA'],
                      hideMainText: true,
                    ),border: InputBorder.none,hintText: '5XXXXXXX',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                  ),
                ),
                SizedBox(height: heigh*0.0132275*10,),
                SizedBox(width: heigh*0.0132275*33,height: heigh*0.0132275*6,
                    child: RaisedButton(child: Center(child: Text(' ارسال ' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.03306,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),
                        onPressed: (){
                          if(phone.text.length==0){
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

                          }else if(email.text.length==0) {
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
                                    content: Text('ادخل  البريد الالكتروني الخاص بك اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                          }else if(name.text.length==0){
                            showDialog(context:context,builder: (context) => Directionality(textDirection:TextDirection.rtl ,
                              child: AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),title: Row(
                                children: [
                                  CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:Color(0xFFffb800),),
                                  SizedBox(width: 10,),
                                  Text(''),
                                ],
                              ),content: Text('ادخل الاسم الخاص بك اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black )),actions: [FlatButton(color:   Color(0xFFffb800),onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('اغلاق',style: TextStyle(fontFamily: 'Cairo',fontSize: 13,color: Colors.black )))],),
                            ),);

                          }else if(report.text.length==0) {
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
                          content: Text('ادخل نص الرساله  اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                            Contact();
                          }
                               }

                   ,color:Color(0xFFffb800))),
                SizedBox(height: heigh*0.0132275*2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
