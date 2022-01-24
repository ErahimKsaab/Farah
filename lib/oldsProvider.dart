import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
class Olds extends StatefulWidget {
  var name;
  Olds({this.name});
  @override
  _OldsState createState() => _OldsState();
}

class _OldsState extends State<Olds> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  void initState() {
    super.initState();
    // Enable virtual display.

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.white,elevation: 0,title: Text(widget.name.toString(), style: TextStyle(color: Colors.black,fontSize:  25,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),centerTitle: true,),
body: Column(
  children: [
        Container(height: 250,

      child:   WebView(



        initialUrl: 'https://www.youtube.com/watch?v=vdV-XCNBgKc',



        onWebViewCreated: (WebViewController webViewController) {



          _controller.complete(webViewController);



        },



      ),

    ),

    Container(height: 250,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/pexels-markus-spiske-369267.png'),fit: BoxFit.fill)),)
  ],
),
    );
  }
}

