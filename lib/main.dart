import 'package:farah/AuthClass.dart';
import 'package:farah/Classes.dart';
import 'package:farah/KHIDMAAGELA.dart';
import 'package:farah/MainPage.dart';
import 'package:farah/Resultoftasnif.dart';
import 'package:farah/SplashScrean.dart';
import 'package:farah/Tafasylmotrep.dart';import 'package:farah/notification.dart';import 'package:farah/Aboutapp.dart';
import 'package:farah/Ra2eseya.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  //await NotificationClass.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       Provider<Authbase>( create: (context) => Auth()),
        ChangeNotifierProvider(create: (context)=>pro()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Farah',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
