import 'package:farah/Drawer.dart';
import 'package:farah/Resultoftasnif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Tasnifat extends StatefulWidget {
  @override
  _TasnifatState createState() => _TasnifatState();
}

class _TasnifatState extends State<Tasnifat> {
  @override
  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  var check=false;
  List Kinds=[ {"name":"لوازم افراح","image":"assets/فعاليات.png","Selected":false},
    {"name":"زفاف","image":"assets/مناسبة خاصة.png","Selected":false},
    {"name":"عيدميلاد","image":"assets/زفاف.png","Selected":false},
    {"name":"حفله افتتاح","image":"assets/pexels-markus-spiske-369267.png","Selected":false},
    {"name":"حفله تخرج","image":"assets/زفاف.png","Selected":false},
    {"name":"فعاليات","image":"assets/زفاف.png","Selected":false},
    {"name":"مناسبه خاصه","image":"assets/WhatsApp Image 2021-12-10 at 10.39.07 PM.png","Selected":false},
    {"name":"ديجي","image":"assets/زفاف.png","Selected":false},
    {"name":"حفلات التخرج \nواعياد الميلاد","image":"assets/WhatsApp Image 2021-12-10 at 10.39.07 PM.png","Selected":false},
    {"name":"خدمات عاجله","image":"assets/WhatsApp Image 2021-12-10 at 10.39.07 PM.png","Selected":false},
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {

    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(key: _scaffoldKey,appBar: AppBar(elevation: 0,backgroundColor: Colors.white,leading: InkWell(onTap: (){
        _scaffoldKey.currentState.openDrawer();
      },child: Icon(Icons.menu,color: Colors.black,size: heigh*0.0132275*3,)),),drawer: AppDrawer(false),
        body: Container(width: weidth,height: heigh,
          child: SingleChildScrollView(physics:  BouncingScrollPhysics(),
            child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:  heigh*0.0132275*1,),
                Container(width: heigh*0.0132275*9,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
                SizedBox(height: heigh*0.0132275,),
                Text('اختر التصنيف الذي ترغب به واحجز افضل الفنانين',style: TextStyle(fontSize:  heigh*0.0132275*1.7,fontWeight: FontWeight.bold,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.0132275*2,),
                Container(padding: EdgeInsets.symmetric(horizontal: heigh*0.0132275),
                  child: new StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: Kinds.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => InkWell(onTap: (){
                      Navigator.push(context,  PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>Resultoftasnif(),transitionDuration: Duration(seconds: 1,),
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
                    },
                      child: new Container(
                          color: Colors.green,
                          child: Stack(fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(Kinds[index]['image'], fit: BoxFit.fill),
                              ),
                              Positioned(bottom: 0,child: Container(child: Center(child: Text(Kinds[index]['name'],style: TextStyle(fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),),width: heigh*0.0132275*8,height: heigh*0.0132275*3,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(
                                topLeft:  Radius.circular(10),
                              ),),)
                              )],
                          )),
                    ),
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: heigh*0.0132275,
                    crossAxisSpacing: 8.0,
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
