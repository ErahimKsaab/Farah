import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:farah/ComonClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class EditHagz extends StatefulWidget {
  var hagz;
  EditHagz({this.hagz});
  @override
  _EditHagzState createState() => _EditHagzState();
}

class _EditHagzState extends State<EditHagz> {
  TextEditingController Namecontroller=TextEditingController();
  TextEditingController pricecontroller=TextEditingController();
  TextEditingController descriptioncontroller=TextEditingController();


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


  Future upload() async {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);

    loadingDialog();
    try {

      var map;

      print('hh');
      if(image1!=null){
        map = {
          "id":widget.hagz['id'],
          "name": Namecontroller.text.toString(),
          "price":  pricecontroller.text.toString(),

          "description":descriptioncontroller.text.toString(),
          "image": await MultipartFile.fromFile(image1?.path, filename: image1?.path?.split('/')?.last),

        };
      }else{
        map = {
          "id":widget.hagz['id'],
          "name": Namecontroller.text.toString(),
       "price":  pricecontroller.text.toString(),

        "description":descriptioncontroller.text.toString(),

        };
      }



      map.removeWhere((key, value) => key == null || value == null);
      FormData formData = new FormData.fromMap(map);
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/updateContentOfSections',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context,'asdasd');
        print(response2.data);
        print('dddddddddddooooneeeeeeeeeeeeeeeeeeeee');
        //  successOrderDialog(response2.data);
        Navigator.pop(context,'asdasd');


        Fluttertoast.showToast(
          msg:  "نجح اتعديل",
          backgroundColor: Color(0xFF202540),
          textColor: Colors.white,
        );
        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setInt('driverid',response2.data['id']);

        //      print(prefs.getInt('driverid'));

      }
    } catch (e) {
      print(e);


    }
  }
  @override
  void initState() {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);
    setState(() {
      Namecontroller.text=widget.hagz['name'];
     pricecontroller.text=widget.hagz['price'];
      descriptioncontroller.text=widget.hagz['description'];

    });
    // TODO: implement initState
    super.initState();
  }
  var image1;
  final ImagePicker _picker = ImagePicker();
  Future getImageGalary() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile!= null) {

        image1 = File(pickedFile.path);


        print("asdddddddddddddddddd");
        print(image1);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  usedd USE=usedd();
  Widget build(BuildContext context) {
    var PROGILEINFO = Provider.of<pro>(context,listen: true);

    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFffb800),centerTitle: false,title:Text( 'تعديل الحجز الخاص بك',style: TextStyle(fontSize: 20),)),
        body: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
          child:Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  image1==null?
                  InkWell(onTap:()=>getImageGalary() ,
                    child: Stack(
                      children: [ ClipOval(
                          child: Image.network(
                            widget.hagz['image'],
                            fit: BoxFit.cover,
                            width: 140.0,
                            height: 140.0,
                          )
                      ),
                        Positioned(bottom: 20,right: 20,child: Icon(Icons.photo,color: Colors.white,))
                      ],
                    ),
                  ):InkWell(onTap:()=>getImageGalary() ,
                    child: Stack(
                      children: [ ClipOval(
                          child: Image.file(
                            image1,
                            fit: BoxFit.cover,
                            width: 140.0,
                            height: 140.0,
                          )
                      ),
                        Positioned(bottom: 20,right: 20,child: Icon(Icons.photo,color: Colors.white,))
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("الاسم",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(maxLines:null ,controller: Namecontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),


                  Row(
                    children: [
                      Text("الوصف",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(controller: descriptioncontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),


                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(" السعر بالريال",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('*',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(maxLines:null ,controller: pricecontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: '',),keyboardType: TextInputType.number,),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),

                  Center(
                    child: SizedBox(height: 50,child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed:()async{

                      if(await USE.checkInternetConnectivity()){
                        if(Namecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text("ادخل الاسم اولا "),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                        }
                        else if(descriptioncontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text( "ادخل  الوصف اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);

                        }else if(pricecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                              SizedBox(width: 10,),
                              Text(''),
                            ],
                          ),content: Text("ادخل السعر اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                            Navigator.pop(context);
                          }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                        }else{
                          upload();
                          /// checksignup(context);
                        }

                      }
                      else{
                        showDialog(context:context,builder: (context) => AlertDialog(title: Row(
                          children: [
                            CircleAvatar(child: Icon(Icons.clear,color: Colors.white ,),backgroundColor:  Color(0xFF202540),),
                            SizedBox(width: 10,),
                            Text( "فشلت العمليه"),
                          ],
                        ),content: Text( "تحقق من الاتصال نت الانترنت"),actions: [FlatButton(color: Color(0xFF202540),onPressed: (){
                          Navigator.pop(context);
                        }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),);
                      }

                    },color:Color(0xFFffb800) ,child: Center(child: Text( "تعديل",style: TextStyle(color: Colors.white),),),)),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ) ,),
      ),
    );
  }
}
