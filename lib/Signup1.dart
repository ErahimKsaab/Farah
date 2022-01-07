import 'package:country_code_picker/country_code_picker.dart';
import 'package:farah/SignUp.dart';
import 'package:farah/Signup2.dart';
import 'package:flutter/material.dart';
class Signup1 extends StatefulWidget {
  var kind;
  Signup1({this.kind});
  @override

  _Signup1State createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  @override
  bool _obscureText = false;
var Country='العربية السعودية';
  var check=false;
 TextEditingController currencycontroller=TextEditingController();
  TextEditingController Citycontroller=TextEditingController();
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
                Text('ادخل الدوله و المدينه و العميه لاكمال التسجيل',style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.04629,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: heigh*0.0132275*2),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('الدوله',style:  TextStyle(fontSize: heigh*0.01984,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                  Row(children: [
                    Icon(Icons.navigate_next,color: Color(0xFFffb800),size: heigh*0.0132275*4,),
                    CountryCodePicker(enabled: true,initialSelection: 'SA',onChanged: (d){
                      FocusScope.of(context).unfocus();
                      setState(() {
                        Country=d.name;
                      });
                      print(d.name);  print(d.hashCode);print(d.flagUri);
                    },
                      favorite: ['+966','SA'],
                      hideMainText: true,
                    ),
                    Text(Country.toString(),style:  TextStyle(fontSize: heigh*0.0238,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                  ],),
                    SizedBox(height: heigh*0.0132275*2,),
                    Text('المدينه',style:  TextStyle(fontSize: heigh*0.01984,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    SizedBox(height: heigh*0.0132275,),
                    Row(
                      children: [
                        Icon(Icons.navigate_next,color: Color(0xFFffb800),size: heigh*0.0132275*4,),
                        Expanded(child: TextFormField ( controller: Citycontroller,decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),)),

                      ],
                    ),
                    SizedBox(height: heigh*0.0132275*2,),
                    Text('العمله',style:  TextStyle(fontSize: heigh*0.01984,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),),
                    SizedBox(height: heigh*0.0132275,),
                    Row(
                      children: [
                        Icon(Icons.navigate_next,color: Color(0xFFffb800),size: heigh*0.0132275*4,),
                        Expanded(child: TextFormField ( controller: currencycontroller,decoration: InputDecoration(border: InputBorder.none,hintText: '',hintStyle: TextStyle(fontSize: heigh*0.01984126,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),)),
                      ],
                    ),

                  ],),
                ),


                SizedBox(height: heigh*0.0132275*9,),
                SizedBox(width: heigh*0.0132275*33,height: heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text('التالي' ,style: TextStyle(fontFamily: 'Cairo',fontSize: 22,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: ()
                  {  if(Citycontroller.text.length==0){
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
                            content: Text('ادخل المدينه اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                  }else if(currencycontroller.text.length==0){
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
                        content: Text('ادخل العمله اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
                        actions: [
                          FlatButton(
                              color: Color(0xFFffb800),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('اغلاق',
                                style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.black ),))
                        ],),
                    );
                  }else{
                    Navigator.push(context,  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>Signup2(kind: widget.kind,City: Citycontroller.text,Country: Country.toString(),Curance:currencycontroller.text ,),transitionDuration: Duration(seconds: 1,),
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
               },color:Color(0xFFffb800))),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
