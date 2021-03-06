import 'package:dio/dio.dart';
import 'package:farah/Classes.dart';
import 'package:farah/KHIDMAAGELA.dart';
import 'package:farah/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:provider/provider.dart';
class HAGZ extends StatefulWidget {
 var conternt,bookingid;
 HAGZ({this.bookingid,this.conternt});
 static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  @override
  _HAGZState createState() => _HAGZState();
}

class _HAGZState extends State<HAGZ> {
  @override
  int index=0;
  TimeOfDay time;
  TimeOfDay packer;
  TimeOfDay time2=TimeOfDay.now();
  TimeOfDay packer2;
  PickResult selectedPickupPlace1,selectedPickupPlace2;
  var latlongforpickup1,latlongforpickup2;
  var position;
  pos()async{
    position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


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

                Text("?????????? ??????????", style: TextStyle(color: Color(0xFF202540),)),
              ],
            ),
          ),
        );
      },
    );
  }
  Future OrderHagz() async {
    var profile = Provider.of<pro>(context,listen: false);
    print(profile.information['id']);
    loadingDialog();
    try {
      FormData formData = new FormData.fromMap({
        "booking_id": widget.bookingid['id'].toString(),
        "content_id": widget.conternt['id'].toString(),
        'history':history.toString(),
        'time':time.format(context).toString(),
        'Booking_kind':kindOfHagzController.text.toString(),
        'max_budget':widget.bookingid['price'].toString(),
        "Booking_description":HagzDetalesController.text.toString(),
        "servesreqyesters_id":profile.information['id'].toString(),
        "servesprovider_id":widget.conternt['servesprovider_id'].toString(),
        "adress":latlongforpickup2.toString(),
        "lat":lat,
        "long":long,
        'section_id':widget.conternt['section_id'].toString(),
        'State':'new',
        'urgent':"0",
      });
      Response response2 = await Dio().post(
        'http://aliensxtech.com/api/addBookingorder',
        data: formData,
      );
      if (response2.statusCode == 200) {
        Navigator.pop(context);
        Fluttertoast.showToast(gravity: ToastGravity.BOTTOM,
          msg: "???? ?????????? ???????? ??????????",
          backgroundColor:Colors.black,
          textColor: Colors.white,
        );
        Navigator.push(context,  PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>MainPage(),transitionDuration: Duration(seconds: 1,),
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
print(response2.data);

      }
    } catch (e) {
      print(e);

    }
  }
  void initState() {
      Geolocator.checkPermission();
    pos();
    super.initState();
  }
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
  var lat,long;
  var history ;

  var AdressController=TextEditingController();
  var kindOfHagzController=TextEditingController();
  var HagzDetalesController=TextEditingController();
  var maxPriceController=TextEditingController();
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
  var ind=0;

  List times=[
    {'yoom':"??????????","time1":'11:20 ??   ??????   11:30 ?? ',"time2":"11:20 ??   ??????   11:30 ?? ",'acc':'yes'},
    {'yoom':"??????????","time1":'11:20 ??   ??????   11:30 ?? ',"time2":"11:20 ??   ??????   11:30 ?? ",'acc':'yes'},
   ];
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(h*0.01322),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h*0.01322*6,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back,color: Colors.black,)),

                  Text('??????', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*2.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                  Opacity(opacity: 0,child: Icon(Icons.arrow_back,color: Colors.black,)),
                ],),
                SizedBox(height: h*0.01322*4,),
                Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  InkWell(onTap: (){

                  },child: Icon(Icons.monetization_on,color:index>=5?Color(0xFFffb800): Colors.grey,size: h*0.01322*2.6,)),
                  InkWell(onTap: (){

                  },child: Icon(Icons.music_note,color:index>=4?Color(0xFFffb800): Colors.grey,size: h*0.01322*2.6,)),
                  InkWell(onTap: (){

                  },child: Icon(Icons.card_giftcard,color:index>=3?Color(0xFFffb800): Colors.grey,size: h*0.01322*2.6,)),
                  InkWell(onTap: (){

                  },child: Icon(Icons.access_time,color:index>=2?Color(0xFFffb800): Colors.grey,size: h*0.01322*2.6,)),
                  InkWell(onTap: (){

                  },child: Icon(Icons.location_on,color:index>=1?Color(0xFFffb800): Colors.grey,size: h*0.01322*2.6,)),
                  Icon(Icons.calendar_today,color:index>=0?Color(0xFFffb800): Colors.grey,size: h*0.01322*2.6,),
                ],),
                SizedBox(height: h*0.01322*4,),
                 if(index==0)Container(width: w,height:  h*0.0132275* 35,color: Colors.white,child: Padding(
                  padding:  EdgeInsets.all(h*0.01322),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('?????? ???????? ???? ?????? ', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.9,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                          Text(widget.conternt['name'], style: TextStyle(color: Color(0xFFffb800),fontSize:  h*0.0132275*1.9 ,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                          Text(' ??', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.9,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                        ],
                      ),
                      SizedBox(height: h*0.01322*2,),
                      Text('???? ???????????? ???????? ?????? ???????? ?????????? ?????????? ????', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*1.2,),
                      Container(height:heigh*0.01322*20 ,color: Colors.white,child: ListView.builder(itemCount: 2,itemBuilder: (context, index) =>Padding(
                        padding:   EdgeInsets.symmetric(horizontal: heigh*0.01322,vertical: heigh*0.022486),
                        child: InkWell(onTap:(){
                          print('asd');
                          times.forEach((element) {
                            print(element['acc']);
                            setState(() {
                              element['acc']="yes";
                            });
                          });
                          setState(() {
                            times[index]['acc']= "no";
                          });
history= times[index]['time2'];
                          print( times[index]['acc'].toString());
                        } ,
                          child: Container(decoration: BoxDecoration(color:times[index]['acc']!= "yes"?Colors.orange:Colors.transparent,borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timer,color: Color(0xFFffb800),),
                                        SizedBox(width: heigh*0.01322/2,),
                                        Text(times[index]['yoom'].toString(),  style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

                                      ],
                                    ),
                                    Text(times[index]['time1'].toString(), style: TextStyle(color: Colors.black,fontSize:  heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),

                                    Text(''),
                            ]),
                              ),
                          ),
                      ),
                        ),),),


                      )],
                  ),
                ),),
                if(index==1)Container(width: w,height: h*0.0132275* 35,color: Colors.white,child: Padding(
                  padding:  EdgeInsets.all(h*0.01058),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' ?????? ???????? ?????????? ', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*2.2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*2,),
                      Text('?????? ???????????? ?????? ??????????????', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*2,),
                      Padding(
                        padding:   EdgeInsets.all(h*0.01058),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                          InkWell(onTap:(){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlacePicker(
                                  apiKey:'AIzaSyC2bVEqTSpeEuzoQ3gcxAumQNjPiLygH_o',
                                  initialPosition:LatLng(position.latitude,position.longitude),
                                  useCurrentLocation: true,
                                  selectInitialPosition: true,

                                  //usePlaceDetailSearch: true,
                                  onPlacePicked: (result) {
                                    selectedPickupPlace1 = result;
                                    Navigator.of(context).pop();
                                    setState(() {});
                                    print(selectedPickupPlace1);
                                  },
                                  selectedPlaceWidgetBuilder:
                                      (_, selectedPlace, state, isSearchBarFocused) {
                                    return isSearchBarFocused
                                        ? Container()
                                        : FloatingCard(
                                      bottomPosition: 0.0,
                                      leftPosition: 0.0,
                                      rightPosition: 0.0,
                                      width:width*0.80,
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: state == SearchingState.Searching
                                          ? Center(
                                          child:
                                          CircularProgressIndicator())
                                          : Column(
                                        children: [
                                          Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),child: Container(width: width,height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Icon(Icons.location_on,),

                                              Container(
                                                width:width*0.85,
                                                child: Text(
                                                  selectedPlace.formattedAddress.toString(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  //      textDirection: TextDirection.rtl,

                                                ),
                                              ),

                                            ],
                                          )),),
                                          SizedBox(   width:width*0.60,
                                            child: FlatButton(color: Color(0xFFffb800),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                              child: Text('???????? ?????? ????????????'),
                                              onPressed: () {
                                                print(selectedPlace.geometry.location);
                                                print(selectedPlace.formattedAddress);
                                                print("ccccccccccccccccccccccccccccccc");
                                                Navigator.pop(context);
                                                setState(() {
                                                  lat=selectedPlace
                                                      .geometry.location.lng;
                                                  long=selectedPlace
                                                      .geometry.location.lat;

                                                  latlongforpickup2=selectedPlace.formattedAddress;

                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )));
                          } ,
                            child: Row(
                              children: [
                                Icon(Icons.my_location,color:Color(0xFFffb800),size: h*0.01322*2.6,),
                                SizedBox(width: h*0.01322*1.5,),
                                Container(width:  h*0.01322*20,height:  h*0.01322*4,child: Text(latlongforpickup2??'?????? ???????????? ?????? ??????????????', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo')   ,overflow: TextOverflow.ellipsis,)),

                              ],
                            ),
                          ),
                          Icon(Icons.search,color:Color(0xFFffb800),size: h*0.01322*2.6,),

                        ],),
                      ),
                      SizedBox(height: h*0.01322*2,),
                      Text('???????? ?????????????? ????????????????', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),

Padding(
  padding:   EdgeInsets.all(h*0.01058),
  child:   TextFormField(maxLength: 100,controller:AdressController,decoration: InputDecoration(hintText:'?????????????? ????????????????' ,border: InputBorder.none),),
)
                    ],
                  ),
                ),),
                if(index==2)Container(width: w,height:  h*0.0132275* 35,color: Colors.white,child: Padding(
                  padding:   EdgeInsets.all(h*0.01058),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' ???? ???? ?????? ???????? ???????? ????????????', style: TextStyle(color: Colors.black45,fontSize:  h*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*2,),
                      Text('?????? ???????? ???????? ??????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*2,),
                      Padding(
                        padding:   EdgeInsets.all(h*0.01058),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                          InkWell(onTap: (){
                            gettime(context);
                          },
                            child: Row(
                              children: [
                                Icon(Icons.access_time,color:Color(0xFFffb800),size: 26,),
                                SizedBox(width: h*0.0198,),
                                Text(time!=null?time.format(context).toString():'???????? ??????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),

                              ],
                            ),
                          ),
                          Opacity(opacity: 0.0,child: Icon(Icons.search,color:Color(0xFFffb800),size: 26,)),

                        ],),
                      ),

                    ],
                  ),
                ),),
                if(index==3)Container(width: w,height:  h*0.0132275* 35,color: Colors.white,child: Padding(
                  padding:   EdgeInsets.all(h*0.01058),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('?????? ?????? ??????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*2,),
                      Text('???????? ?????? ?????????? ???????? ??????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                      SizedBox(height: h*0.01322*2,),
                      Padding(
                        padding:   EdgeInsets.all(h*0.01058),
                        child:   TextFormField(controller:kindOfHagzController,decoration: InputDecoration(hintText:'?????? ??????????' ,border: InputBorder.none),),
                      ),

                    ],
                  ),
                ),),
                if(index==4)Container(width: w,height: h*0.0132275* 35,color: Colors.white,child: Padding(
                  padding:   EdgeInsets.all(h*0.01058),
                  child: SingleChildScrollView( physics: BouncingScrollPhysics(),
                    child: Column(  mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('???????? ?????? ???????????????? ???? ?????? ????????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                        SizedBox(height: h*0.01322*2,),
                        Text('???????????? ???????????? ?????????? ?????? ???????? ???? ???????????????? ?????? ?????????? ?????????? ???? ?????? ?????????????? ???????????? , ???????????? ?????????? , ?? ???? ???????????? ????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)),
                        SizedBox(height: h*0.01322*2,),
                    Container(constraints: BoxConstraints(maxHeight: 384.4),height: double.infinity,color: Colors.white,width: double.infinity,child:   TextFormField(controller: HagzDetalesController,maxLines: 4,maxLength: 150,decoration: InputDecoration(hintText:'.???????? ??????......... ' ,border: InputBorder.none),),)

                      ],
                    ),
                  ),
                ),),
                if(index==5)Container(width: w,height: h*0.0132275* 35,color: Colors.white,child: Padding(
                  padding:   EdgeInsets.all(h*0.01058),
                  child: SingleChildScrollView( physics: BouncingScrollPhysics(),
                    child: Column(  mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(' ?????????????? ??????????', style: TextStyle(color: Colors.black,fontSize:  h*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',)),
                        SizedBox(height: h*0.01322*5,),
Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
  Text(widget.bookingid['price'], style: TextStyle(color:Color(0xFFffb800),fontSize:  h*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))

,Text(    '   ????????', style: TextStyle(color:Color(0xFFffb800),fontSize:  h*0.0132275*1.8,fontWeight: FontWeight.bold,fontFamily: 'Cairo',))
],)
                      ],
                    ),
                  ),
                ),),

                SizedBox(height: h*0.01322*2*4,),
                SizedBox(width: h*0.0132275*33,height: h*0.0132275*6,child: RaisedButton(child: Center(child: Text(index==5?"?????? ????????":'????????????' ,style: TextStyle(fontFamily: 'Cairo',fontSize: h*0.01322*2.2,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: (){
if(index==0&&history!=null){
  setState(() {
    index=1;
  });
}else if(index==0&&history==null){
  Fluttertoast.showToast(gravity: ToastGravity.CENTER,
    msg: '???????? ???????? ?????????? ????????',
    backgroundColor:Colors.black,
    textColor: Colors.white,
  );

}else if(index==1&&latlongforpickup2!=null){
  setState(() {
    index=2;
  });
  print(history);
}else if(index==1&&(latlongforpickup2==null||AdressController.text.length==0)){
  Fluttertoast.showToast(gravity: ToastGravity.CENTER,
    msg: '???????? ???????? ?????????? ????????',
    backgroundColor:Colors.black,
    textColor: Colors.white,
  );
}else if(index==2&&time!=null){
  setState(() {
    index=3;
  });
}else if(index==2&&time==null){
  Fluttertoast.showToast(gravity: ToastGravity.CENTER,
    msg: '???????? ,???? ?????????? ????????',
    backgroundColor:Colors.black,
    textColor: Colors.white,
  );

}else if(index==3&&kindOfHagzController.text.length!=0){
  setState(() {
    index=4;
  });
}else if(index==3&&kindOfHagzController.text.length==0){
  Fluttertoast.showToast(gravity: ToastGravity.CENTER,
    msg: '???????? ?????? ?????????? ????????',
    backgroundColor:Colors.black,
    textColor: Colors.white,
  );
}else if(index==4&&HagzDetalesController.text.length!=0){
  setState(() {
    index=5;
  });
}else if(index==4&&HagzDetalesController.text.length==0){
  Fluttertoast.showToast(gravity: ToastGravity.CENTER,
    msg: '???????? ???????????? ?????????? ????????',
    backgroundColor:Colors.black,
    textColor: Colors.white,
  );
}else if(index==5&&maxPriceController.text.length==0){
  OrderHagz();
}
                  //                  if(index==5){
//                  print('object');
//                  }else{
//                    setState(() {
//                      index++;
//                    });
//                  }


                }

                   ,color:Color(0xFFffb800))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
