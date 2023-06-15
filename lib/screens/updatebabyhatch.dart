import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class updatebabyhatchScreen extends StatefulWidget {

  final String bhID,bhName,bhState,bhAdress,bhHotline,mapLatitude,mapLongitude;
  updatebabyhatchScreen({Key? key, required this.bhID, required this.bhName, required this.bhState, required this.bhAdress, required this.bhHotline, required this.mapLatitude, required this.mapLongitude}) : super(key: key);

  @override
  _updatebabyhatchScreenState createState() => _updatebabyhatchScreenState();
}

class _updatebabyhatchScreenState extends State<updatebabyhatchScreen> {
  var nameTextController =  TextEditingController();
  var stateTextController =  TextEditingController();
  var addressTextController =  TextEditingController();
  var hotlineTextController =  TextEditingController();
  var latTextController =  TextEditingController();
  var longTextController =  TextEditingController();

  @override
  void initState() {
    super.initState();

     nameTextController.text =widget.bhName;
     stateTextController.text =widget.bhState;
     addressTextController.text =widget.bhAdress;
     hotlineTextController.text =widget.bhHotline;
     latTextController.text =widget.mapLatitude;
     longTextController.text =widget.mapLongitude;



  }

  _submit(id,name,state,address,hotline,lat,long) async {
    var data = {
      "action": "updatebaby",
      "id":id,
      "name":name,
      "state":state,
      "address":address,
      "hotline":hotline,
      "lat":lat,
      "long":long
    };
    var returnData = await dioHttpPostRequest(context,data,"updatebaby.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){


        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);

      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);



      }


    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Baby Hatch"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Name'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: stateTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                    hintText: 'State'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: hotlineTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Hotline',
                    hintText: 'Hotline'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: latTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Latitude',
                    hintText: 'Latitude'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: longTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Longitude',
                    hintText: 'Longitude'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 10,
                controller: addressTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: 'Address'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () {
                  _submit(widget.bhID,nameTextController.text,stateTextController.text,addressTextController.text,hotlineTextController.text,latTextController.text,longTextController.text);
                  /* Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));*/
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}