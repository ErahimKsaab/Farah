import 'package:cached_network_image/cached_network_image.dart';
import 'package:farah/Classes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ListOfTasnifat extends StatefulWidget {
  @override
  _ListOfTasnifatState createState() => _ListOfTasnifatState();
}

class _ListOfTasnifatState extends State<ListOfTasnifat> {
  var id,name;
  @override
  Widget build(BuildContext context) {
    final weidth=MediaQuery.of(context).size.width;
    final heigh=MediaQuery.of(context).size.height;
    final con = Provider.of<pro>(context, listen: false);
    return Scaffold(
      body: Container(width: weidth,height: heigh,
        child: SingleChildScrollView(physics:  BouncingScrollPhysics(),
          child: Column( mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:  heigh*0.0132275*6,),
              Container(width: heigh*0.0132275*9,child: Image.asset('assets/WhatsApp Image 2021-12-10 at 10.39.32 PM.png',fit: BoxFit.fill,)),
              SizedBox(height: heigh*0.0132275,),
              Text('اختر القسم المناسب',style: TextStyle(fontSize:  heigh*0.0132275*2,fontWeight: FontWeight.bold,fontFamily: 'Cairo',),),      SizedBox(height: heigh*0.0132275*2,),
              GridView.builder(physics:  BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
                itemCount: con.Sections.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      con.Sections.forEach((element) {
                        print(element['selected']);
                        setState(() {
                          element['selected']=false;
                        });
                      });
                      setState(() {
                        con.Sections[index]['selected']=true;
                        id=  con.Sections[index]['id'];
                        name=con.Sections[index]['name'];
                        print(name);
                      });
                      print(id);

//                    setState(() {
//                      damage[index]++;
//                    });
                    },
                    onLongPress: () {
//                    setState(() {
//                      damage[index] = 0;
//                    });
                    },
                    child: Container(decoration: BoxDecoration( color: con.Sections[index]['selected']==true? Colors.amber.withOpacity(0.5):Colors.white,  borderRadius: BorderRadius.all(Radius.circular(20)) ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: heigh*0.01058),
                          CachedNetworkImage(height: 50,width: 50,
                            imageUrl:  con.Sections[index]['image'],fit: BoxFit.fill,
                            placeholder: (context, url) => CircularProgressIndicator(backgroundColor: Color(0xFFffb800),),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),

                          Text(
                              con.Sections[index]['name'],textAlign: TextAlign.center,
                              style:TextStyle(fontSize:heigh*0.0132275*1.5,fontWeight: FontWeight.normal,fontFamily: 'Cairo',)
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),


              SizedBox(height:heigh*0.013227*2,),
              SizedBox(width: heigh*0.43650,height:  heigh*0.0132275*6,child: RaisedButton(child: Center(child: Text('تم' ,style: TextStyle(fontFamily: 'Cairo',fontSize: heigh*0.033,color: Colors.white ),), ),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),),onPressed: (){
           if (id!=null&&name!=null){
                  print(id);
                  con.Sections.forEach((element) {
                    print(element['Selected']);
                    setState(() {
                      element['selected']=false;
                    });
                  });

Navigator.pop(context,[name,id],);
                }else {
                  print('no');
                }
              },color:Color(0xFFffb800))),
              SizedBox(height:heigh*0.013227*3,)
            ],
          ),
        ),
      ),
    );
  }
}
