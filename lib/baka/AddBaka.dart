import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:farah/ComonClass.dart';
import 'package:farah/ListOfKhademat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class addbaka extends StatefulWidget {
  @override
  _addbakaState createState() => _addbakaState();
}

class _addbakaState extends State<addbaka> {
  TextEditingController Namecontroller=TextEditingController();
  TextEditingController describtioncontroller=TextEditingController();
  TextEditingController pricecontroller=TextEditingController();
  TextEditingController Numcontroller=TextEditingController();
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

var numsec;
  Future upload() async {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);

    loadingDialog();
    try {

      var map;

      print('hh');
      map = {

          "section_id": numsec.toString(),
          "servesprovider_id": PROGILEINFO.information['id'],
          "rate": "0",
          "name":Namecontroller.text.toString(),
          "price": pricecontroller.text.toString(),
          "image": await MultipartFile.fromFile(image1?.path, filename: image1?.path?.split('/')?.last),
          "people_rate": "0",
          "description":describtioncontroller.text.toString(),

      };


      map.removeWhere((key, value) => key == null || value == null);
      FormData formData = new FormData.fromMap(map);
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/addContentOfSections',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context,'asd');
        Navigator.pop(context,'asd');
      }
    } catch (e) {
      print(e);


    }
  }
  @override
  void initState() {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);

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


    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFFffb800),centerTitle: false,title:Text( 'اضافه حجز',style: TextStyle(fontSize: 20),)),
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
                          child: Image.asset(
                            'assets/no image.jpg',
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
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("القسم",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  InkWell(onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>ListOfTasnifat())).then((value){
                      if (value!=null){
                        setState(() {
                          Numcontroller.text=value[0];
                          numsec=value[1];
                          print(numsec);
                        });
                      }
                    });
                  },
                    child: Container(child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(child: TextFormField(enabled: false,controller: Numcontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: 'لم يتم الضبط'),)),
                       Icon(Icons.keyboard_arrow_down,color: Color(0xFFffb800),size: 30,)
                          ],
                        ),
                      ),
                    ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                    ),),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("الاسم",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(controller: Namecontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text( "السعر",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text("",style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [


                          Expanded(child: TextFormField(controller:pricecontroller,decoration: InputDecoration(   border: InputBorder.none,hintText:''),)),
                          Text('ريال'),
                        ],

                      ),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text( "الوصف",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                      Text('',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(controller: describtioncontroller,decoration: InputDecoration(   border: InputBorder.none,hintText:''),),
                    ),
                  ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                  ),),

                  SizedBox(height: 20,),

                  Center(
                    child: SizedBox(height: 50,child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed:()async{

                      if(await USE.checkInternetConnectivity()){
                        if(image1==null){
                          showDialog(context:context,builder: (context) => Directionality(textDirection:TextDirection.rtl ,
                            child: AlertDialog(title: Row(
                              children: [
                                CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                SizedBox(width: 10,),
                                Text(''),
                              ],
                            ),content: Text("ادخل الصوره اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                              Navigator.pop(context);
                            }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),
                          ),);
                        }else       if(Namecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => Directionality(textDirection:TextDirection.rtl ,
                            child: AlertDialog(title: Row(
                              children: [
                                CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                SizedBox(width: 10,),
                                Text(''),
                              ],
                            ),content: Text("ادخل الاسم اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                              Navigator.pop(context);
                            }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),
                          ),);
                        }
                        else if(pricecontroller.text.length==0){
                          showDialog(context:context,builder: (context) => Directionality(textDirection:TextDirection.rtl ,
                            child: AlertDialog(title: Row(
                              children: [
                                CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                SizedBox(width: 10,),
                                Text(''),
                              ],
                            ),content: Text( "ادخل السعر اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                              Navigator.pop(context);
                            }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),
                          ),);

                        }else if(describtioncontroller.text.length==0){
                          showDialog(context:context,builder: (context) =>  Directionality(textDirection:TextDirection.rtl ,
                            child: AlertDialog(title: Row(
                              children: [
                                CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                SizedBox(width: 10,),
                                Text(''),
                              ],
                            ),content: Text("ادخل الوصف اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                              Navigator.pop(context);
                            }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),
                          ),);
                        }else if(numsec==null){
                          showDialog(context:context,builder: (context) =>  Directionality(textDirection:TextDirection.rtl ,
                            child: AlertDialog(title: Row(
                              children: [
                                CircleAvatar(child: Icon(Icons.clear,color:Colors.white ,),backgroundColor:   Color(0xFF202540),),
                                SizedBox(width: 10,),
                                Text(''),
                              ],
                            ),content: Text("اختر القسم المناسب اولا"),actions: [FlatButton(color:   Color(0xFF202540),onPressed: (){
                              Navigator.pop(context);
                            }, child: Text( "غلق",style: TextStyle(color: Colors.white),))],),
                          ),);
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

                    },color:Color(0xFFffb800) ,child: Center(child: Text( "اضافه",style: TextStyle(color: Colors.white),),),)),
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
