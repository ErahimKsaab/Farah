import 'package:flutter/material.dart';
class Ra2esi extends StatefulWidget {
  @override
  _Ra2esiState createState() => _Ra2esiState();
}

class _Ra2esiState extends State<Ra2esi> {
  @override
  var ind=0;
  List notfi=[
    {'name':"المعلومات الاساسيه","selected":true},
    {'name':"الباقات","selected":false},
    {'name':" الاوقات المتاحه","selected":false},
    {'name':"معرض الاعمال","selected":false},];
  List times=[
    {'yoom':"السبت","time1":'11:20 م   الي   11:30 م ',"time2":"11:20 م   الي   11:30 م "},
    {'yoom':"الاحد","time1":'11:20 م   الي   11:30 م ',"time2":"11:20 م   الي   11:30 م "},
    {'yoom':"الاتنين","time1":'11:20 م   الي   11:30 م ',"time2":null},
{'yoom':"الثلاثاء","time1":'11:20 م   الي   11:30 م ',"time2":"11:20 م   الي   11:30 م "},
{'yoom':"الاريعاء","time1":'11:20 م   الي   11:30 م ',"time2":null},
{'yoom':"الخميس","time1":'11:20 م   الي   11:30 م ',"time2":"11:20 م   الي   11:30 م "},
{'yoom':"الجمعه","time1":'11:20 م   الي   11:30 م ',"time2":"11:20 م   الي   11:30 م "},];
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:   Container(height: heigh,width: weidth,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: heigh*0.01322*4,),
                Padding(
                  padding:   EdgeInsets.all(heigh*0.010582),
                  child: Container(height: heigh*0.01322*5,width: weidth,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                   CircleAvatar(backgroundImage: ExactAssetImage('assets/التفاصيل.png'),radius: 25,),
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
                      });
                    },
                      child: Container(height: heigh*0.01322*5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color:notfi[index]["selected"]==true? Color(0xFFffb800):Colors.white,width: 1)),child: Center(child: Padding(
                        padding:   EdgeInsets.all( heigh*0.01322*0.8),
                        child: Text(notfi[index]['name'].toString(), style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      ) ,),),
                    ),
                  ),)),
                ),
                if(ind==2)                Container(height:heigh*0.01322*60 ,color: Colors.white,child: ListView.builder(itemCount: times.length,itemBuilder: (context, index) =>Padding(
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
                          Opacity(opacity: 0,
                            child: Row(
                              children: [
                                Icon(Icons.timer,color: Color(0xFFffb800),),
                                Text(times[index]['yoom'].toString(),),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(times[index]['time1'].toString(), style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                              if( times[index]['time2']!=null)  Text(times[index]['time2'].toString(), style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                              if( times[index]['time2']==null) Row(children: [
                                Icon(Icons.add,color:Color(0xFFffb800) ,),
                                Text('اضافه ساعات محدده', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                              ],)
                            ],
                          ),
                          Column(children: [
                            Opacity(opacity:0,child: Icon(Icons.clear,color:Color(0xFFffb800) ,)),

                            Opacity(opacity: times[index]['time2']==null? 0:1,child: Icon(Icons.clear,color:Color(0xFFffb800) ,)),


                          ],)
                        ],
                      ),
                      Text(''),
                    ],
                  ),
                ),),),
                if(ind==1) Container(height:heigh*0.01322*60 ,color: Colors.white,child: Center(child: Text('لا يوجد باقات', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),)),
                if(ind==0) Container(height:heigh*0.01322*60 ,color: Colors.white,child: Center(child: Text('لا يوجد معلومات الان', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),)),
                if(ind==3) Container(height:heigh*0.01322*60 ,color: Colors.white,child: Center(child: Text('المعرض فارغ الان', style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),))


              ],
            ),
          ),
        ),
      ),
    );
  }
}
