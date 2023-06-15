import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';
import 'package:babyhatch/widgets/chat_item.dart';
import 'package:babyhatch/widgets/custom_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:babyhatch/theme/color.dart';
import 'package:babyhatch/screens/updatebabyhatch.dart';

class editbabyPage extends StatefulWidget {

  @override
  _editbabyPageState createState() => _editbabyPageState();
}

class _editbabyPageState extends State<editbabyPage> {
  late List listbaby=[];

  @override
  void initState() {
    super.initState();
    _listbaby();
  }

  _listbaby() async {
    print("masuk sini");
    var data = {
      "action": "listbabyhatch",
    };
    var returnData = await dioHttpPostRequest(context,data,"babyhatch.php",1,"Please wait..","brewing data..");
    print("xxxyyyyxxx");
    print(returnData);
    print("xxxyyyyxxx");
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        print("list bbyghhact");
        print(returnData);
        setState(() {
          listbaby=returnData['data'];
        });
        print("koko");
        print(listbaby);
        // Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);



        /* Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RootApp())

        );*/

        // screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);
        //Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

        // _myorder();


      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);


      }


    }



  }
  _deletebaby(bhID) async {
    print("masuk sini");
    var data = {
      "action": "deletebaby",
      "bhID": bhID,
    };
    var returnData = await dioHttpPostRequest(context,data,"deletebaby.php",1,"Please wait..","brewing data..");
    print("xxxyyyyxxx");
    print(returnData);
    print("xxxyyyyxxx");
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        print("list delete");

        print("koko");
        // Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);



        /* Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RootApp())

        );*/

        screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);
        //Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

        // _myorder();


      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);
        /*if(returnData['count_result']=="0"){
          setState(() {
            statusrekod="false";
          });

        }else{

          Navigator.of(context).pushNamedAndRemoveUntil('/Menu', (Route<dynamic> route) => false);
          screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);

        }*/

      }


    }



  }

  buildBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
          children: [
            getHeader(),
            getChats(),
          ]
      ),
    );
  }

  getHeader(){
    return
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Column(
            children: [

              SizedBox(height: 15),

            ],
          )
      );
  }

  getChats(){
    return
      ListView(
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          children: List.generate(listbaby.length,
                  (index) =>
                  Container(
                    width: 200,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                         // color: Colors.black,
                          width: 500,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listbaby[index]["bhName"], maxLines: 1, overflow: TextOverflow.visible,
                                style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                child:Text("   Edit   ",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => updatebabyhatchScreen(bhID:listbaby[index]["bhID"],bhName:listbaby[index]["bhName"],bhState:listbaby[index]["bhState"],bhAdress:listbaby[index]["bhAdress"],bhHotline:listbaby[index]["bhHotline"],mapLatitude:listbaby[index]["mapLatitude"],mapLongitude:listbaby[index]["mapLongitude"]),
                                    ),
                                  );
                                 // final String bhID,bhName,bhState,bhAdress,bhHotline,mapLatitude,mapLongitude;
                                  //Detailinfographice(listcontent[index]["igDesc"]);
                                },
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                child:Text("  Delete  ",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                onTap: (){

                                  showDialog(

                                      builder: (ctxt) {
                                        return AlertDialog(
                                            insetPadding: EdgeInsets.zero,
                                            title: Text("Alert"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text("Do you really want to delete?"),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    MaterialButton(
                                                      child: Text("Cancel"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    MaterialButton(
                                                      child: Text("Yes"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        _deletebaby(listbaby[index]["bhID"]);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ));
                                      },
                                      context: context);




                                  //Detailinfographice(listcontent[index]["igDesc"]);
                                },
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  )
          )
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("List of Baby Hatch"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
              // handle the press
            },
          ),
        ],
      ),
      body: buildBody(),
    );
  }
}