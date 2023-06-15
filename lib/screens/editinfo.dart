import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';
import 'package:babyhatch/widgets/chat_item.dart';
import 'package:babyhatch/widgets/custom_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:babyhatch/theme/color.dart';
import 'package:babyhatch/screens/updateinfo.dart';

class editinfoPage extends StatefulWidget {

  @override
  _editinfoPageState createState() => _editinfoPageState();
}

class _editinfoPageState extends State<editinfoPage> {
  late List listinfo=[];

  @override
  void initState() {
    super.initState();
    _listcontent();
  }

  _listcontent() async {
    print("masuk sini");
    var data = {
      "action": "listbabyhatch",
    };
    var returnData = await dioHttpPostRequest(context,data,"content.php",1,"Please wait..","brewing data..");
    print("xxxyyyyxxx");
    print(returnData);
    print("xxxyyyyxxx");
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        print("list bbyghhact");
        print(returnData);
        setState(() {
          listinfo=returnData['data'];
        });
        print("koko");
        print(listinfo);
        // Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);





        // screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);
        //Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

        // _myorder();


      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);


      }


    }



  }
  _deleteContent(igID) async {
    print("masuk sini");
    var data = {
      "action": "listbabyhatch",
      "igID": igID,
    };
    var returnData = await dioHttpPostRequest(context,data,"deletecontent.php",1,"Please wait..","brewing data..");
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("List Infographic",
                          style: TextStyle(fontSize: 28, color: Colors.black87, fontWeight: FontWeight.w600)
                          ,)
                    ),
                  ),
                ],
              ),
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
          children: List.generate(listinfo.length,
                  (index) =>
                      Container(
                        width: 200,
                        height: 200,
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
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: listinfo[index]["igImage"],
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 120, right: 15,
                              child: Row(
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
                                      child:Text("Edit",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => updateinfographicScreen(igID:listinfo[index]["igID"],igName:listinfo[index]["igName"],igImage:listinfo[index]["igImage"],igDesc:listinfo[index]["igDesc"]),
                                          ),
                                        );

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
                                      child:Text("Delete",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
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
                                                              _deleteContent(listinfo[index]["igID"]);
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
                            ),
                            Positioned(
                              top: 160,
                              child: Container(
                                color: Colors.black,
                                width: 500,
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listinfo[index]["igName"], maxLines: 1, overflow: TextOverflow.visible,
                                      style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 10,),

                                  ],
                                ),
                              ),
                            )
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