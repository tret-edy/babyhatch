import 'package:url_launcher/url_launcher.dart';


//import 'package:progress_indicator_button/progress_button.dart';

import 'package:flutter/material.dart';
import 'package:babyhatch/utils/data.dart';
import 'package:babyhatch/widgets/chat_item.dart';
import 'package:babyhatch/screens/navigate.dart';


class ListPageMap2 extends StatefulWidget {
  const ListPageMap2({ Key? key }) : super(key: key);

  @override
  _ListPageMap2State createState() => _ListPageMap2State();
}

class _ListPageMap2State extends State<ListPageMap2> {
  var _isLoading=false;
  var title= "Find A Baby Hatch Near You";
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
          children: [
            getHeader(),
        MaterialButton(
          minWidth: 200.0,
          height: 35,
          color: Color(0xFF801E48),
          onPressed: () {
            setState(() {
              _isLoading=true;
            });
            Future.delayed(Duration(seconds: 3), () {
              setState(() {
                _isLoading=false;
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: _isLoading==true
                ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            )
                : Text('$title',style: new TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
        ),
            _isLoading==false ?
            getChats()
                :
                Container(),
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
                        child: Text("Baby Hatches Map",
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

   httpJob(AnimationController controller) async {
    controller.forward();
    print("delay start");
    await Future.delayed(Duration(seconds: 3), () {});
    print("delay stop");
    controller.reset();
  }

  getChats(){
    return
      ListView(
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          children: List.generate(chats.length,
                  (index) => ChatItem(chats[index],
                onTap: ()async{
                 /* const String lat = "42.3540";
                  const String lng = "71.0586";
                  const String mapUrl = "geo:$lat,$lng";
                  if (await canLaunch(mapUrl)) {
                  await launch(mapUrl);
                  } else {
                  throw "Couldn't launch Map";
                  }*/
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NavigationScreen(
                          double.parse("3.1626"),
                          double.parse("101.7122"))));
                  //MapUtils.openMap(-3.823216,-38.481700);
                },
              )
          )
      );
  }
}

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
   // Uri googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    var googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=-3.823216,-38.481700');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}