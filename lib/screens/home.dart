
import 'package:babyhatch/screens/newfq.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:babyhatch/theme/color.dart';
import 'package:babyhatch/utils/data.dart';
import 'package:babyhatch/widgets/category_box.dart';
import 'package:babyhatch/widgets/feature_item.dart';
import 'package:babyhatch/widgets/notification_box.dart';
import 'package:babyhatch/widgets/recommend_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:babyhatch/utils/function.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:babyhatch/screens/newinfografik.dart';
import 'package:babyhatch/screens/editinfo.dart';
import 'package:babyhatch/screens/newbabyhatch.dart';
import 'package:babyhatch/screens/root_app.dart';
import 'package:babyhatch/screens/editbaby.dart';
import 'package:babyhatch/screens/editfq.dart';
import 'package:babyhatch/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late List infocall=[];
  late List listcontent=[];

  var username;
  var user_type;
  getlocalMemoryData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username =  prefs.getString("username");
      user_type =  prefs.getString("user_type");
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getlocalMemoryData();
    _listcontent();
    _listbabyhatch();
  }

  _listbabyhatch() async {
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
          infocall=returnData['data'];
        });
        print("koko");
        print(infocall);

      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);


      }


    }



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
          listcontent=returnData['data'];
        });
        print("koko");
        print(listcontent);



      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);


      }


    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerc(),
        key: scaffoldKey,
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,//appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        )
    );
  }

  Widget getAppBar(){
    return
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('$username', style: TextStyle(color: labelColor, fontSize: 14,),),
                SizedBox(height: 5,),
                Text("Good Morning!", style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 18,)),

              ],
            )
            ),

            NotificationBox(
              notifiedNumber: 0,
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ) ,
            Text("Settings",style: TextStyle(color: textColor, fontWeight: FontWeight.w500),),
            SizedBox(width: 15,),
            Container(
              //padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appBarColor,
                border: Border.all(color: Colors.grey.withOpacity(.3)),
              ),
              child:  IconButton(
                color: Colors.green,
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RootApp(),
                    ),
                  );

                  // handle the press
                },
              ),
            ),

          ],
        ),
      );
  }

  Widget drawerc(){
    return Drawer(

      child: ListView(
        children:  <Widget>[
          user_type=="1"?
          Column(
            children: [
              ListTile(
                  title: Text("Add New Infographic"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newInfoScreen(),
                      ),
                    );
                  }

              ),
              ListTile(
                  title: Text("Edit Infographic"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => editinfoPage(),
                      ),
                    );
                  }
              ),
              Divider(
                height: 2,
                color: Colors.grey,
              ),

              ListTile(
                  title: Text("Add Baby Hatch"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newbabyhatchScreen(),
                      ),
                    );
                  }

              ),
              ListTile(
                  title: Text("Edit Baby Hatch"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => editbabyPage(),
                      ),
                    );
                  }
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),

              ListTile(
                  title: Text("Add FAQ"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newfqScreen(),
                      ),
                    );
                  }

              ),
              ListTile(
                  title: Text("Edit FAQ"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => editfqPage(),
                      ),
                    );
                  }
              ),

              Divider(
                height: 2,
                color: Colors.grey,
              ),
            ],
          )
              :
          Container(),

          ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap:(){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Signin()),
                        (Route<dynamic> route) => false);
              }
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),


        ],
      ),
    );
  }


  buildBody(){
    return
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                getCategories(),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Text("Our Stories", style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                ),
                getFeature(),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("24 Hour Support Helpline", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textColor),),
                      //Text("See all", style: TextStyle(fontSize: 14, color: darker),),
                    ],
                  ),
                ),
                getRecommend(),
              ]
          ),
        ),
      );
  }

  int selectedCollection = 0;
  getCategories(){
    return   Container(
      width: MediaQuery.of(context).size.width,
      // height: double.infinity,
      alignment: Alignment.center, // This is needed
      child: Image.asset(
        "assets/orphancarelogo2.png",
        fit: BoxFit.contain,
        //width: 1300,
        //height: 400,
      ),
    );

  }

  getFeature(){
    return
      CarouselSlider(
          options: CarouselOptions(
            height: 290,
            enlargeCenterPage: true,
            disableCenter: true,
            viewportFraction: .75,
          ),
          items: List.generate(listcontent.length,
                  (index) {
                return Container(
                  width: 200,
                  height: 290,
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
                        imageUrl: listcontent[index]["igImage"],
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 170, right: 15,
                        child: Container(
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
                            child:Text("Read More..",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                            onTap: (){
                              Detailinfographice(listcontent[index]["igDesc"]);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        child: Container(
                          width: 500,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listcontent[index]["igName"], maxLines: 1, overflow: TextOverflow.visible,
                                style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );

              }
          )
      );
  }

  getRecommend(){
    return
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(infocall.length, (index) =>
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                      onTap: (){
                        _makePhoneCall(infocall[index]["bhHotline"]);
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/fonpink.png",height: 50,width: 50,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(infocall[index]["bhName"], maxLines: 1, overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(infocall[index]["bhHotline"], style: TextStyle(fontSize: 14, color: textColor),),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule_rounded, color: labelColor, size: 14,),
                                      SizedBox(width: 2,),
                                      Text("24/7", style: TextStyle(fontSize: 12, color: labelColor),),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star, color: orange, size: 14,),
                                      SizedBox(width: 2,),

                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                      )
                  ),
                )
            )
        ),
      );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


  Detailinfographice(desc){
    showMaterialModalBottomSheet(
        context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                return SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child:  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      ),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                            child: Flexible
                              (child:  Text(desc,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,),)
                        )
                    ),
                  ),
                );
              }
          );


        }
    );
  }


}