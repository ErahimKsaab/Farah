import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:farah/Classes.dart';
import 'package:farah/Drawer.dart';
import 'package:farah/login.dart';
import 'package:farah/Resultoftasnif.dart';
import 'package:farah/Signup1.dart';
import 'package:farah/Tasnifat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:farah/KHIDMAAGELA.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  bool _obscureText = false;

  var check=false;
  List Kinds=[
    {"name":"لوازم افراح","image":"assets/لوازم افراح.svg","Selected":false},
    {"name":"فنانين","image":"assets/فنانيين.svg","Selected":false},
    {"name":"فنانات","image":"assets/فنانات.svg","Selected":false},
    {"name":"مصورين","image":"assets/مصورين.svg","Selected":false},
    {"name":"مصورات","image":"assets/مصورات.svg","Selected":false},
    {"name":"فرق شعبيه","image":"assets/فرق شعبيه.svg","Selected":false},
    {"name":"زفات","image":"assets/زفات.svg","Selected":false},
    {"name":"ديجي","image":"assets/ديجي.svg","Selected":false},
    {"name":"حفلات التخرج \nواعياد الميلاد","image":"assets/حفلات التخرج واعياد ميلاد.svg","Selected":false},
    {"name":"خدمات عاجله","image":"assets/خدمه عاجلة.svg","selected":false},
  ];
  var id,name;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
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

    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    final con = Provider.of<pro>(context, listen: false);
    return WillPopScope(onWillPop: ()async{
      bool backStatus = onWillPop();
      if (backStatus) {
        exit(0);
      }
      return false;
    },
      child: Directionality(textDirection:TextDirection.rtl ,
        child: Scaffold(key: _scaffoldKey,appBar: AppBar(elevation: 0,backgroundColor: Colors.white,leading: InkWell(onTap: (){
          _scaffoldKey.currentState.openDrawer();
        },child: Icon(Icons.menu,color: Colors.black,size: heigh*0.03968,)),),drawer: AppDrawer(false),
          body: Container(width: weidth,height: heigh,
            child: SingleChildScrollView(physics:  BouncingScrollPhysics(),
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:  heigh*0.0132275*1,),
                  Container(width: heigh*0.0132275*9,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
                  SizedBox(height: heigh*0.0132275,),
                  Text('اختر القسم المناسب',style: TextStyle(fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.0132275*2,),
                   GridView.builder(physics:  BouncingScrollPhysics(),
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
                     itemCount: con.Sections.length,
                     shrinkWrap: true,
                     itemBuilder: (BuildContext context, index) {
                       return InkWell(
                         onTap: () {
                           con.Sections.forEach((element) {
                             print(element['selected']);
                             setState(() {
                               element['selected']=false;
                             });
                           });
                           setState(() {
                             con.Sections[index]['selected']=true;
                             id=  con.Sections[index]['id'];
                             name=con.Sections[index]['name'];
                             print(name);
                           });
print(id);
                           Kinds.forEach((element) {
                             print(element['Selected']);
                             setState(() {
                               element['Selected']=false;
                             });
                           });
                           setState(() {
                             Kinds[index]['Selected']=true;
                           });
//                    setState(() {
//                      damage[index]++;
//                    });
                         },
                         onLongPress: () {
//                    setState(() {
//                      damage[index] = 0;
//                    });
                         },
                         child: Container(decoration: BoxDecoration( color: con.Sections[index]['selected']==true? Colors.amber.withOpacity(0.5):Colors.white,  borderRadius: BorderRadius.all(Radius.circular(20)) ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               SizedBox(height: heigh*0.01058),
                               CachedNetworkImage(height: 50,width: 50,
                                 imageUrl:  con.Sections[index]['image'],fit: BoxFit.fill,
                                 placeholder: (context, url) => CircularProgressIndicator(backgroundColor: Color(0xFFffb800),),
                                 errorWidget: (context, url, error) => Icon(Icons.error),
                               ),

                               Text(
                                   con.Sections[index]['name'],textAlign: TextAlign.center,
                                 style:TextStyle(fontSize:heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)
                               ),
                             ],
                           ),
                         ),
                       );
                     },
                   ),

                  InkWell(onTap:(){
                    con.Sections.forEach((element) {
                      print(element['Selected']);
                      setState(() {
                        element['selected']=false;
                      });
                    });

                    Kinds.forEach((element) {
                      print(element['Selected']);
                      setState(() {
                        element['Selected']=false;
                      });
                    });
                    setState(() {
                      Kinds[9]['Selected']=true;
                    });
                  } ,
                    child: Padding(
                      padding:  EdgeInsets.all(heigh*0.013227).copyWith(top: heigh*0.013227+5),
                      child: Container( decoration: BoxDecoration( color:Kinds[9]['Selected']==true? Colors.amber.withOpacity(0.5):Colors.white,  borderRadius: BorderRadius.all(Radius.circular(20)) ),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                          SvgPicture.asset(Kinds[9]['image'],height: heigh*0.013227*5,width: heigh*0.013227*5,),
                          SizedBox(width: heigh*0.013227*2,),
                          Text(Kinds[9]['name'],style: TextStyle(fontSize:heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)) ,


                        ],),
                      ),
                    ),
                  ),
                  SizedBox(height:heigh*0.013227*2,),
                  SizedBox(width: heigh*0.43650,height:  heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text('تم' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.033,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: (){
                  if(Kinds[9]['Selected']==true){
                    con.Sections.forEach((element) {
                      print(element['Selected']);
                      setState(() {
                        element['selected']=false;
                      });
                    });

                    Kinds.forEach((element) {
                      print(element['Selected']);
                      setState(() {
                        element['Selected']=false;
                      });
                    });
                    Navigator.push(context,  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>Agel(),transitionDuration: Duration(seconds: 1,),
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
                  }else if(id!=null&&id!=null){
                    print(id);
                    con.Sections.forEach((element) {
                      print(element['Selected']);
                      setState(() {
                        element['selected']=false;
                      });
                    });

                    Kinds.forEach((element) {
                      print(element['Selected']);
                      setState(() {
                        element['Selected']=false;
                      });
                    });
                    Navigator.push(context,  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>Resultoftasnif(id: id ,name: name,),transitionDuration: Duration(seconds: 1,),
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
                  }else {
                    print('no');
                  }
                  },color:Color(0xFFffb800))),
SizedBox(height:heigh*0.013227*3,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
