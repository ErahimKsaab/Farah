import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:farah/AuthClass.dart';
import 'package:farah/ComonClass.dart';
import 'package:farah/Signup3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
class Signup2 extends StatefulWidget {
  var City,kind,Curance,Country;
  Signup2({this.City,this.Country,this.kind,this.Curance});
  @override
  _Signup2State createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  @override
  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
  Future checksignupServiceProvider() async {
    loadingDialog();
    try {
      FormData formData = new FormData.fromMap({
        "email ": EmailController.text,
        "phonenum": "$pricode"+PhonenumberController.text.toString(),
      });
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/checksignupServiceProvider',
        data: formData,
      );
      if (response2.statusCode == 200) {
        //    Navigator.pop(context);
        print(response2.data);
        if(response2.data=='These phone do not match our records.'){
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
                  content: Text(' رقم الهاتف مستخدم بالفعل',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
        }else if(response2.data=='this email Already used'){
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
                  content: Text(' البريد الالكتروني مستخدم بالفعل',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
          _Loginphone(context);
         // _Loginphone(context);
        }

      }
    } catch (e) {
      print(e);

    }
  }
  Future checksignupServicereqester() async {
    loadingDialog();
    try {
      FormData formData = new FormData.fromMap({
        "email ": EmailController.text,
        "phonenum": "$pricode"+PhonenumberController.text.toString(),
      });
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/checksignupServiceRequester',
        data: formData,
      );
      if (response2.statusCode == 200) {
        //    Navigator.pop(context);
        print(response2.data);
        if(response2.data=='These phone do not match our records.'){
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
                  content: Text(' رقم الهاتف مستخدم بالفعل',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
        }else if(response2.data=='this email Already used'){
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
                  content: Text(' البريد الالكتروني مستخدم بالفعل',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
          _Loginphone(context);
          // _Loginphone(context);
        }

      }
    } catch (e) {
      print(e);

    }
  }
  _Loginphone(BuildContext context)async{

    final auth=Provider.of<Authbase>(context,listen: false);
    try{
      await auth.signupbyphone( "$pricode"+PhonenumberController.text.toString(), context,["$pricode"+PhonenumberController.text.toString(),widget.kind,widget.Country,widget.Curance,widget.City,PasswordController.text.toString(),EmailController.text,NameController.text],'Signup');
    }on PlatformException catch (e){
      print("gggggggggggggggggggggggg");
      print(e);
      Navigator.pop(context);
    }
  }
  usedd USE=usedd();
  var check=false;
  TextEditingController PhonenumberController=TextEditingController();
  TextEditingController NameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
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
                SizedBox(height:heigh*0.0132275*7,),
                Container(width: heigh*0.0132275*13,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
                SizedBox(height: heigh*0.0132275*4,),
                Text('الرجاء ادخال الاسم و رقم الهاتف و كلمه المرور',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.04629,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [

                    Text('الاسم كاملا',style:  TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    TextFormField (controller: NameController,keyboardType: TextInputType.emailAddress,  decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),


                  ],),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('رقم الهاتف',style:  TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    Directionality(textDirection:TextDirection.rtl ,
                      child: TextFormField(controller: PhonenumberController,keyboardType: TextInputType.phone,decoration: InputDecoration(suffixIcon:CountryCodePicker(enabled: true,initialSelection: 'SA',onChanged: (d){
                        FocusScope.of(context).unfocus();
                        print(d.name);  print(d.hashCode);print(d.flagUri);
                        pricode=d.dialCode.toString();
                      },
                        favorite: ['+966','SA'],
                        hideMainText: true,
                      ),border: InputBorder.none,hintText: 'XXXXXXX',hintStyle: TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                    ),
                    Text('البريد الالكتروني',style:  TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    TextFormField (controller: EmailController,keyboardType: TextInputType.emailAddress,  decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),
                    Text('كلمه المرور',style:  TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    Row(
                      children: [
                        Expanded(child: TextFormField ( controller: PasswordController, obscureText:!_obscureText,decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),)),
                        IconButton(icon: Icon(  _obscureText ? Icons.visibility
                            : Icons.visibility_off,color:Color(0xFFffb800)), onPressed:_toggle)
                      ],
                    ),

                  ],),
                ),


                SizedBox(height: heigh*0.0132275*9,),
                SizedBox(width: heigh*0.0132275*33,height: heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text('التالي' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.02910,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: ()
                   async {


                      if(await USE.checkInternetConnectivity()){
                        if(NameController.text.length==0){
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

                        }else   if(PhonenumberController.text.length==0){
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

                    }else if(EmailController.text.length==0) {
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
                              content: Text('ادخل البريد الالكتروني الخاص بك اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                    }else if(!USE.checkEmailFormat(EmailController.text.trim())) {
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
                              content: Text('ادخل بريد الكتروني صحيح',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                      if(widget.kind=='requester'){
                        print('requester');
                        checksignupServicereqester();
                      }else{
                        print('provider');
                        checksignupServiceProvider();
                      }
                    //login();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
