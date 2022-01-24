import 'dart:convert';


import 'package:farah/OtpLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


abstract class Authbase {
  Stream<User> ok();
  User get currentUser;
  Future<bool>  signupbyphone(String phone, BuildContext context,List list,String kind);
  Loginbyphone(String phone, BuildContext context,kind);
  Future<void> signout();
}

class Auth implements Authbase {

  final _usedauth = FirebaseAuth.instance;
  Stream<User> ok() => _usedauth.authStateChanges();

  final _codeController = TextEditingController();
  User get currentUser => _usedauth.currentUser;

  asd(verificationId,code)async{

    AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

    final result = await _auth.signInWithCredential(credential);
  }


  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<bool> Loginbyphone(String phone, BuildContext context,kind) async{
    print("dddddddddddddddddddddd");
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds:50),
        verificationCompleted: (AuthCredential credential) async{
          print("ssssssssssssssssdddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffffffffff");
        },
        verificationFailed: (exception){
          Navigator.pop(context);
          // dialogs(click: true,context: context,t: 'Login Failed !',a:'OK' ,C: exception.message.toString(),F: (){ Navigator.pop(context); });
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          Navigator.pop(context);
          //   Navigator.push(context, MaterialPageRoute(builder: (context) =>OTPFORSIGNUP(verificationId: verificationId,kind: kind,) ,));

        },
        codeAutoRetrievalTimeout: (c){
          print('object');
        }
    );
  }
  Future<bool> signupbyphone(String phone, BuildContext context,List list,String Kind) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async{
        await  print("ssssssssssssssssdddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffffffffff");
      },
      verificationFailed: ( exception){

        print(exception);

        print("sssssssssssssssssssssssss");
        print(exception);
      },

      codeSent: (String verificationId, [int forceResendingToken]){
         Navigator.pop(context);
        print("LoginByPhoneSeccUSED");

        Navigator.push(context, MaterialPageRoute(builder: (context) =>otpsignup(verificationId: verificationId,kind:Kind ,list: list,) ,));

      },
      codeAutoRetrievalTimeout: (c){
//        showDialog(context:context,builder: (context) => AlertDialog(title: Row(
//          children: [
//            CircleAvatar(child: Icon(Icons.clear,color: whiteColor ,),backgroundColor: primaryColor,),
//            widthSpace,
//            Text('Sign Up Failed')
//          ],
//        ),content: Text('Time Out ,Try Again'),actions: [FlatButton(color: primaryColor,onPressed: (){
//          Navigator.pop(context);
//        }, child: Text('Close',style: TextStyle(color: Colors.white),))],),);
        //   Navigator.pop(context);
      },
    ).catchError((c){
      print(c);
      print("1111111111111111111111111111111111111");
    });
  }


  @override

  Future<void> signout() async {
    await _usedauth.signOut();

  }
}