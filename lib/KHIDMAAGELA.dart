import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
class Agel extends StatefulWidget {
  @override
  _AgelState createState() => _AgelState();
}

class _AgelState extends State<Agel> {
  @override
  TimeOfDay time=TimeOfDay.now();
  TimeOfDay packer;
  TimeOfDay time2=TimeOfDay.now();
  TimeOfDay packer2;
  Future gettime(BuildContext context)async{
    packer=await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(packer!=null){
      setState(() {
        time=packer;
      });
      print(time.format(context));
    }
  }
  DateTime selectedDate = DateTime.now();
  DateTime history ;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        history = picked;
      });
    print("${history.toLocal()}".split(' ')[0]);
  }
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
  Future AddOrder() async {
    final con = Provider.of<pro>(context, listen: false);
    loadingDialog();
    try {
      FormData formData = new FormData.fromMap({
        "State": "orderd",
        "servesreqyesters_id": con.information['id'],
        'time':time.format(context).toString().toString(),
        'history':"${history.toLocal()}".split(' ')[0],
        'Booking_kind':KindOforder.text.toString(),
        'max_budget':MaxMoney.text.toString(),
        'urgent':"1",
      });
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/addUrgentService',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pop(context);
        showTopSnackBar(
          context,
          CustomSnackBar.success(backgroundColor:Colors.amber ,icon:Icon( Icons.done,color: Colors.transparent,),
            message:
            ' تم ارسال طلبك بنجاح سنتواصل معك في اقرب وقت',
          ),
        );

        print(response2.data);

      }
    } catch (e) {
      print(e);

    }
  }
  @override
  var KindOforder=TextEditingController();
  var MaxMoney=TextEditingController();
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: heigh*0.01322*3,right: heigh*0.01322,left: heigh*0.01322),
                child: Align(alignment:Alignment.topCenter ,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: heigh*0.01322*5,width: weidth,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        InkWell(onTap: (){
                          Navigator.pop(context);
                        },child: Icon(Icons.arrow_back,color: Colors.black,)),
                        Text('طلب خدمه عاجله', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                        Opacity(opacity: 0,child: Icon(Icons.arrow_forward,color: Colors.black,)),
                      ],),),
                       SizedBox(height: heigh*0.01322*3.5,),
                       Text('نوع الخدمه', style: TextStyle(color: Colors.black45,fontSize:  heigh*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: heigh*0.01322,),
                      Container(width: weidth,height: heigh*0.01322*6,child: Row(
                        children: [
                          Icon(Icons.navigate_next,color: Colors.amber,size: 45,),
                          Expanded(child: TextFormField ( controller: KindOforder,decoration: InputDecoration(border: InputBorder.none,hintText: 'عيد ميلاد',hintStyle: TextStyle(fontSize: heigh*0.01984126*1.3,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),)),

                        ],
                      ),),
                      SizedBox(height: heigh*0.03703,),
                      Text('التاريخ', style: TextStyle(color: Colors.black45,fontSize:  heigh*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: heigh*0.01322,), Container(width: weidth,height: heigh*0.01322*6,child: Row(
                        children: [

                          Icon(Icons.calendar_today,color: Colors.amber,size: 30,),
                          SizedBox(width: heigh*0.01322,),
                          InkWell(onTap:(){
                            _selectDate(context);
                          },child: Text(history!=null?"${history.toLocal()}".split(' ')[0]:"ضبط الان", style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275* 1.8,fontWeight: FontWeight.normal,fontFamily: 'Cairo',))),

                        ],
                      ),),
                      SizedBox(height: heigh*0.03703,),
                      Text('الساعه', style: TextStyle(color: Colors.black45,fontSize:  heigh*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: heigh*0.01322,), Container(width: weidth,height: heigh*0.01322*6,child: Row(
                        children: [

                          Icon(Icons.timer,color: Colors.amber,size: 30,),
                          SizedBox(width: heigh*0.01322,),
                          InkWell(onTap: (){
                            gettime(context);
                          },child: Text(packer!=null?time.format(context).toString():'ضبط الان', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.8,fontWeight: FontWeight.normal,fontFamily: 'Cairo',))),

                        ],
                      ),),
                      SizedBox(height: heigh*0.03703,),
                      Text('السعر الاقصي', style: TextStyle(color: Colors.black45,fontSize:  heigh*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),  SizedBox(height: 10,),
                      Container(width: weidth,height: heigh*0.01322*6,child: Row(
                        children: [
                          SizedBox(width: heigh*0.01322,),
                          Expanded(child: TextFormField ( keyboardType: TextInputType.number,controller: MaxMoney,decoration: InputDecoration(border: InputBorder.none,hintText: '0',hintStyle: TextStyle(color:Colors.amber ,fontSize: heigh*0.01984126*1.3,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),)),
                          SizedBox(width: heigh*0.01322,),
                          Text('ريال', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2.0,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                          SizedBox(width: heigh*0.01322,),
                        ],
                      ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: heigh*0.03703,),
              SizedBox(width: heigh*0.4100,height: heigh*0.01322*5,child: 
              RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),onPressed: (){
                if(KindOforder.text.length==0){
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
                      content: Text('ادخل نوع الخدمه اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                }
                else  if(packer==null){
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
                      content: Text('ادخل الوقت اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                }else if(history==null){
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
                      content: Text('ادخل التاريخ اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                }else if(MaxMoney.text.length==0){
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
                      content: Text('ادخل السعر الاقصي اولا',style: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.black ),),
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
                  AddOrder();
                }
                
              },color: Colors.amber,
                child: Text('ارسال الطلب', style: TextStyle(color: Colors.white,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

              )),
              SizedBox(height: heigh*0.03703,),
            ],
          ),
        ),
      ),
    );
  }
}
