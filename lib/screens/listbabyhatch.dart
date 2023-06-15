import 'package:flutter/material.dart';
import 'package:babyhatch/utils/data.dart';
import 'package:babyhatch/widgets/chat_item.dart';
import 'package:babyhatch/widgets/custom_textfield.dart';
import 'package:babyhatch/utils/function.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatefulWidget {
  const ListPage({ Key? key }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  late List listbaby=[];

  @override
  void initState() {
    super.initState();
    _listbaby();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
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
          padding: EdgeInsets.fromLTRB(0, 60, 0, 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("List of Baby Hatches",
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
          children: List.generate(listbaby.length,
                  (index){
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image(
                              image: AssetImage("assets/images.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child:
                              Container(
                                  child:
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: Container(
                                                  child: Text(listbaby[index]['bhName'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                                              )
                                          ),
                                          SizedBox(width: 5),

                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: Container(
                                                  child: Text(listbaby[index]['bhAdress'], maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                                              )
                                          ),
                                          SizedBox(width: 5),

                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child:InkWell(
                                              onTap: (){

                                                _makePhoneCall(listbaby[index]["bhHotline"]);

                                              },
                                              child: Container(
                                                  child: Text(listbaby[index]['bhHotline'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),

                                        ],
                                      ),
                                      SizedBox(height: 5,),

                                    ],
                                  )
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
          )
      );

  }
}