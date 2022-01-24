import 'dart:convert';

import 'package:farah/Classes.dart';
import 'package:farah/ComonClass.dart';
import 'package:farah/Drawer.dart';
import 'package:farah/Updateuserprofile.dart';
import 'package:farah/baka/AddBaka.dart';
import 'package:farah/baka/AddBocking.dart';
import 'package:farah/baka/EditHagz.dart';
import 'package:farah/hagzzz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class Ra2esi extends StatefulWidget {
  @override
  _Ra2esiState createState() => _Ra2esiState();
}

class _Ra2esiState extends State<Ra2esi> {
  TextEditingController Namecontroller=TextEditingController();
  TextEditingController citycontroller=TextEditingController();
  TextEditingController currencycontroller=TextEditingController();
  TextEditingController Emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController Phonecontroller=TextEditingController();

  @override
  void initState() {
    var PROGILEINFO = Provider.of<pro>(context,listen: false);

    print(PROGILEINFO.information['id']);
    setState(() {
      Namecontroller.text=PROGILEINFO.information['name'];
      Emailcontroller.text=PROGILEINFO.information['email'];
      passwordcontroller.text=PROGILEINFO.information['password'];
      citycontroller.text=PROGILEINFO.information['city'];

      currencycontroller.text=PROGILEINFO.information['currency'];


      Phonecontroller.text=PROGILEINFO.information['phonenum'];
    });
    // TODO: implement initState
    getproviderpaqa();// TODO: implement initState
    super.initState();
  }
  var ind=0;
  List notfi=[
    {'name':"المعلومات الاساسيه","selected":true},
    {'name':"الحجوزات","selected":false},
    {'name':" الاوقات المتاحه","selected":false},
    {'name':"معرض الاعمال","selected":false},];
  List times=[
    {'yoom':"السبت","time1":'11:20 م   الي   11:30 م ','mode':"false"},
    {'yoom':"الاحد","time1":'11:20 م   الي   11:30 م ','mode':"false"},
    {'yoom':"الاتنين","time1":'11:20 م   الي   11:30 م ','mode':"false"},
{'yoom':"الثلاثاء","time1":'11:20 م   الي   11:30 م ','mode':"false"},
{'yoom':"الاريعاء","time1":'11:20 م   الي   11:30 م ','mode':"false"},
{'yoom':"الخميس","time1":'11:20 م   الي   11:30 م ','mode':"false"},
{'yoom':"الجمعه","time1":'11:20 م   الي   11:30 م ','mode':"false"}];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var baka=[];
  var Loading=true;
  Future getproviderpaqa() async {

    var PROGILEINFO = Provider.of<pro>(context,listen: false);
    print('5');
    print(PROGILEINFO.information['id']);
    print('asdasd');
    try {
      http.Response response =
      await http.get('http://aliensxtech.com/api/ContentOfSections/${PROGILEINFO.information['id']}');
      if (response.statusCode == 200) {
        print('asdasd');
        setState(() {
          baka = json.decode(response.body);
        });
        setState(() {
          Loading=false;
        });
        print(json.decode(response.body).runtimeType);
        print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
        print(baka);
        print(baka);

      }else{
        print('asdasdasdads');
      }
    } catch (e) {
      print(e);
//      print(e);

      await Future.delayed(Duration(seconds: 1));

    }
  }
  usedd USE=usedd();
  Future deleteBookig(id)async{
    print('delete');
    try{
      http.Response response = await http.delete('http://aliensxtech.com/api/deleteBookig/$id');
      if(response.statusCode==200){
        print('ok');
        getproviderpaqa();
      }
    }catch(e){
      await Future.delayed(Duration(seconds: 1));
      print('error');

    }
  }
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(key: _scaffoldKey,appBar: AppBar(elevation: 0,backgroundColor: Colors.white,leading: InkWell(onTap: (){
        _scaffoldKey.currentState.openDrawer();
      },child: Icon(Icons.menu,color: Colors.black,size: heigh*0.03968,)),),drawer: AppDrawer(false),
        backgroundColor: Colors.white,
        body:   Container(height: heigh,width: weidth,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: heigh*0.01322*4,),
                Padding(
                  padding:   EdgeInsets.all(heigh*0.010582),
                  child: Container(height: heigh*0.01322*5,width: weidth,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    baka.isNotEmpty?    CircleAvatar(backgroundImage: NetworkImage(baka[0]['image']),radius: 25,):SizedBox(),
                    Text('الرئيسيه', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*3,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                    Opacity(opacity: 0,child: Icon(Icons.arrow_forward,color: Colors.black,)),
                  ],),),
                ),
                SizedBox(height: heigh*0.01322*3,),
                Padding(
                  padding:   EdgeInsets.symmetric(horizontal: heigh*0.01322*0.8),
                  child: Container(height: heigh*0.01322*5,width: weidth,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: notfi.length,itemBuilder: (context, index) => Padding(
                    padding:   EdgeInsets.all( heigh*0.01322*0.8),
                    child: InkWell(onTap: (){
                      setState(() {
                        for(int i=0;i<notfi.length;i++){
                          notfi[i]["selected"]=false;
                        }
                        notfi[index]["selected"]=true;
                        ind=index;
                        print(ind);
                      });
                    },
                      child: Container(height: heigh*0.01322*5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color:notfi[index]["selected"]==true? Color(0xFFffb800):Colors.white,width: 1)),child: Center(child: Padding(
                        padding:   EdgeInsets.all( heigh*0.01322*0.8),
                        child: Text(notfi[index]['name'].toString(), style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      ) ,),),
                    ),
                  ),)),
                ),
                if(ind==0)Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                  child:Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: SingleChildScrollView(
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                              child: TextFormField(enabled: false,controller: Namecontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                            ),
                          ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                          ),),

                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text( "البريد الالكتروني",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                              Text('',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(enabled: false,controller: Emailcontroller,decoration: InputDecoration(   border: InputBorder.none,hintText:''),),
                            ),
                          ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                          ),),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text( "رقم الهاتف",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                              Text('',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(enabled: false,controller: Phonecontroller,decoration: InputDecoration(   border: InputBorder.none,hintText:''),),
                            ),
                          ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                          ),),

                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("المدينه",style: TextStyle(color:Color(0xFF202540),fontSize: 16 ),),
                              Text('',style: TextStyle(color:Color(0xFF202540),fontSize: 17 ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(enabled: false,maxLines:null ,controller: citycontroller,decoration: InputDecoration(    border: InputBorder.none,hintText: ''),),
                            ),
                          ),width: MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Color(0xFF202540).withOpacity(0.2),)
                          ),),
                          SizedBox(height: 20,),
                          Center(
                            child: SizedBox(height: 50,child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed:()async{

                              if(await USE.checkInternetConnectivity()){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
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
                if(ind==2)
                  Container(height:heigh*0.01322*60 ,color: Colors.white,child: ListView.builder(itemCount: times.length,itemBuilder: (context, index) =>Padding(
                  padding:   EdgeInsets.symmetric(horizontal: heigh*0.01322,vertical: heigh*0.022486),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer,color: Color(0xFFffb800),),
                              SizedBox(width: heigh*0.01322/2,),
                              Text(times[index]['yoom'].toString(),  style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                            ],
                          ),

                        ],
                      ),
                      Text(times[index]['time1'].toString(), style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),

                      Switch(onChanged: (C){
                        print(C);
                      },value: times[index]['mode'].parseBool()),
                      Text(''),
                    ],
                  ),
                ),),),
                if(ind==1) Loading==true? Container(height:heigh*0.01322*60,child: Center(child: CircularProgressIndicator())):baka.isEmpty?Container(height:heigh*0.01322*40 ,color: Colors.white,child: Center(child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('لا يوجد  اي حجز لديك', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => addbaka(),)).then((value){
                        if(value!=null){
                          getproviderpaqa();
                        }
                      });
                    },color:Color(0xFFffb800),child: Text('اضف حجز الان', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),)
                  ],
                ),)):
                Stack(children: [
              //    Container(height: heigh*0.43650,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(baka[0]['image']),fit: BoxFit.fill)),width: weidth,),
                  Align(alignment: Alignment.bottomCenter,child: Container(child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: heigh*0.01322,horizontal: heigh*0.01984),
                    child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                      child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      //    Text('اسم مقدم الخدمه',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                          SizedBox(height: heigh*0.01322,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => Olds(name: widget.content['name'],),));
                              },child: Text(baka[0]['name'],style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if(int.parse(baka[0]['rate'])==5)    Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                    ],
                                  ),
                                  if(int.parse(baka[0]['rate'])==4)    Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                    ],
                                  ),
                                  if(int.parse(baka[0]['rate'])==3)    Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                    ],
                                  ),
                                  if(int.parse(baka[0]['rate'])==2)    Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                    ],
                                  ),
                                  if(int.parse(baka[0]['rate'])==1)    Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                      Icon(Icons.star,color: Colors.amber,size: heigh*0.01984,)
                                    ],
                                  ),

                                  if(int.parse(baka[0]['rate'])==0)
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                        Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                        Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                        Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,),
                                        Icon(Icons.star,color: Colors.grey,size: heigh*0.01984,)
                                      ],
                                    ),
                                 Text('  ${baka[0]['rate']}    (${baka[0]['people_rate']})  تقييم  ',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                                  InkWell(onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => EditHagz(hagz: baka[0],),)).then((value){
                                      if(value!=null){
                                        getproviderpaqa();
                                      }
                                    });
                                  },child: Icon(Icons.settings)),

                                ],
                              ),

                            ],
                          ),

                          SizedBox(height: heigh*0.01984,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('السعر',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                              Text(baka[0]['price'] + " ريال ",style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                            ],
                          ),

                          SizedBox(height: heigh*0.01984,),
                          Text(baka[0]['description'],style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                          SizedBox(height: heigh*0.01984,),
                          Text('الباقات',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                          SizedBox(height: heigh*0.01322,),
//                  Row(
//                    children: [
//                      Row(
//                        children: [
//                          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.orange,),child: Icon(Icons.crop_square,color: Colors.orange,)),
//                          SizedBox(width:heigh*0.01322/2 ,),
//                          Text('بأيقاع',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.9,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
//
//                        ],
//                      ),
//                      SizedBox(width:heigh*0.01984,),
//                      Row(
//                        children: [
//                          Icon(Icons.crop_square),
//                          SizedBox(width: heigh*0.01322/2,),
//                          Text(' بدون أيقاع',style: TextStyle(color: Colors.grey,fontSize:  heigh*0.0132275*1.9,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
//                        ],
//                      )
//                    ],
//                  ),
                          SizedBox(height: heigh*0.01322*2,),
                          baka[0]['booking'].isEmpty?Container(width: heigh*0.423,height: heigh*0.01322*12,child: Center(child: Column(
                            children: [
                              Text('لايوجد اي باقات لديك',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                           SizedBox(height: 25,),
                              RaisedButton(onPressed:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>AddBocking(id:baka[0]['id'] ,) ,)).then((value){
                         if(value!=null){
                           getproviderpaqa();
                         }
                       });
                              },color: Colors.amber,child: Text('اضف الان ',style: TextStyle(color: Colors.white,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),),
                            ],
                          ),)):
                          Container(width: heigh*0.423,height: heigh*0.01322*12,
                            child: ListView.builder( physics: BouncingScrollPhysics(),

                                shrinkWrap: true,scrollDirection: Axis.horizontal,
                                itemCount:1,
                                itemBuilder: (context,index){
                                  var vb=baka[0];
                                  return  Padding(
                                    padding:   EdgeInsets.symmetric(horizontal: heigh*0.01322),
                                    child: Container(child: Column(
                                      children: [
                                        Text('حفله افتتاح',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),  SizedBox(height: heigh*0.01322,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('${vb['booking'][index]['hours']} ساعه',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)), Text('${vb['booking'][index]['price']} ريال',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                                          ],
                                        ),
                                        SizedBox(height: heigh*0.01322,),
                                        RaisedButton(onPressed:(){
                                          deleteBookig(vb['booking'][index]['id']);
                                        },color: Colors.amber,child: Text('حذف',style: TextStyle(color: Colors.white,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),),

                                      ],
                                    ),height: heigh*0.01322*12,width: heigh*0.01322*13,color: Colors.amber.withOpacity(0.2),),
                                  );
                                }),
                          ),
                          SizedBox(height: heigh*0.01322*2,),
                        ],
                      ),
                    ),
                  ),height: heigh*0.01322*45,width:weidth,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),),))
                ],),
                //if(ind==0) Container(height:heigh*0.01322*60 ,color: Colors.white,child: Center(child: Text('لا يوجد معلومات الان', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),)),
                if(ind==3) Container(height: 500,width: weidth-20,
                  child: ListView(children: [
                    Container(height: 220,decoration: BoxDecoration(borderRadius:   BorderRadius.circular(20),image: DecorationImage(image: ExactAssetImage('assets/التفاصيل.png'),fit: BoxFit.fill)),),
Card(child: Container(height: 100,child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text('اعمال السابقة للجنة حول الموضوع واستجابات الدول والهيئات التي تمت استشارتها',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),textAlign: TextAlign.end,textDirection: TextDirection.ltr,),
), ),
),
                    Card(child: Container(height: 100,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Text('اعمال السابقة للجنة حول الموضوع واستجابات الدول والهيئات التي تمت استشارتها',style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',),textAlign: TextAlign.end,textDirection: TextDirection.ltr,),
                    ), ),
                    ),

                    Container(height: 220,decoration: BoxDecoration(borderRadius:   BorderRadius.circular(20),image: DecorationImage(image: ExactAssetImage('assets/التفاصيل.png'),fit: BoxFit.fill)),),

                  ],),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
