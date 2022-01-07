import 'package:farah/ChooseLogin.dart';
import 'package:flutter/material.dart';
class Signup3 extends StatefulWidget {
  var phone,City,kind,accurance,email,country,password;
  Signup3({this.phone,this.City,this.kind,this.accurance,this.email,this.password,this.country});
  @override
  _Signup3State createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  @override





  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        body: Container(width: weidth,height: heigh,
          child: SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:heigh*0.0132275*7,),
                Container(width: heigh*0.0132275*13,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
                SizedBox(height: heigh*0.0132275*4,),
                Text('الرجاء ادخال الاسم كامل',style: TextStyle(fontSize: heigh*0.02248,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.04629,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [

                    Text('الاسم كاملا',style:  TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    TextFormField (keyboardType: TextInputType.emailAddress,  decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.019841,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),


                  ],),
                ),


                SizedBox(height: heigh*0.0132275*26,),
                SizedBox(width: heigh*0.0132275*33,height: heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text('التالي' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.029100,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: ()=>
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
                )),color:Color(0xFFffb800))),
                SizedBox(height: heigh*0.0132275*3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
