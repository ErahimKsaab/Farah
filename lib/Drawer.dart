import 'package:farah/Classes.dart';
import 'package:farah/Loginpage.dart';
import 'package:farah/Ra2eseya.dart';
import 'package:farah/Updateuserprofile.dart';
import 'package:farah/hogozaty.dart';
import 'package:flutter/material.dart';
import 'package:farah/notification.dart';
import 'package:farah/Aboutapp.dart';import 'package:farah/Contactus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppDrawer extends StatefulWidget {
  final bool fromHome;

  AppDrawer([this.fromHome = true]);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var ss;
  void initState() {
    as();
    super.initState();
  }
as()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  ss=pref.get('kindofusers');
  print(ss);
}
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Builder(builder: (BuildContext context){
      final con = Provider.of<pro>(context, listen: true);
      return Drawer(
        child: SafeArea(
          child:
            ListView(
              children: [
                SizedBox(
                  height: heigh*0.0158730*2,
                ),
                Container(
                  padding: EdgeInsets.only(left: heigh*0.0158730, right: heigh*0.0158730, top: heigh*0.013227*2),
                  color: theme.scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(heigh*0.010582, heigh*0.010582*2, heigh*0.010582, heigh*0.010582*2),
                        child: Row(
                          children: [

                            SizedBox(width: heigh*0.0216402),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(con.information['name'],
                                    style: TextStyle(fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',),),
                                  SizedBox(height: 6),
                                  Text(con.information['phonenum'],
                                      style: theme.textTheme.caption),
                                  SizedBox(height: 4),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.close),
                    color:Color(0xFFffb800),
                          iconSize:25,
                          onPressed: () => Navigator.pop(context)),
                      SizedBox(
                        height: heigh*0.01058,
                      ),
                    ],
                  ),
                ),
                buildListTile(
                    context, Icons.home, 'حسابي','assets/حسابي.svg', ()async {

//      if(ss=='user'){
//        print('object');
//      }else{
//        print('b');
   Navigator.pop(context);
   Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
//      }



                }),
                buildListTile(context, Icons.person,
                    'حجوزاتي',"assets/حجوزاتي.svg", () {
Navigator.pop(context);
Navigator.push(context, MaterialPageRoute(builder: (context) => hogozat(),));
                    }),
                buildListTile(context, Icons.drive_eta,
                    'الاشعارات', 'assets/عن التطبيق.svg',() {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => notification(),));
                    }),
                buildListTile(
                    context, Icons.star,'عن التطبيق','assets/عن التطبيق.svg',
                        () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp(),));
                    }),
                buildListTile(context, Icons.account_balance_wallet,
                    'اتصل بنا','assets/اتصل بنا.svg', () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
                    }),
                buildListTile(context, Icons.local_offer,'تسجيل الخروج', 'assets/تسجيل خروح.svg',() async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.push(context,  PageRouteBuilder(
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
                  ));
                }),



              ],
            ),

        ),
      );
    });
  }

  ListTile buildListTile(BuildContext context, IconData icon, String title,String image,
      [Function onTap]) {
    var theme = Theme.of(context);
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return ListTile(
      leading: CircleAvatar(radius: heigh*0.013227*2,backgroundColor: Color(0xFFffb800),child: SvgPicture.asset(image??'assets/تسجيل خروح.svg'),),
      title: Text(
        title,
        style: TextStyle(fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',),),

      onTap: onTap as void Function(),
    );
  }
}
