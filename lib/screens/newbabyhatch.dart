import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class newbabyhatchScreen extends StatefulWidget {

  @override
  _newbabyhatchScreenState createState() => _newbabyhatchScreenState();
}

class _newbabyhatchScreenState extends State<newbabyhatchScreen> {
  var nameTextController =  TextEditingController();
  var stateTextController =  TextEditingController();
  var addressTextController =  TextEditingController();
  var hotlineTextController =  TextEditingController();
  var latTextController =  TextEditingController();
  var longTextController =  TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _submit(name,state,address,hotline,lat,long) async {
    var data = {
      "action": "newbaby",
      "name":name,
      "state":state,
      "address":address,
      "hotline":hotline,
      "lat":lat,
      "long":long
    };
    var returnData = await dioHttpPostRequest(context,data,"newbaby.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
         nameTextController.text ="";
         stateTextController.text ="";
         addressTextController.text ="";
         hotlineTextController.text ="";
         latTextController.text ="";
         longTextController.text ="";



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
        title: Text("New Baby Hatch"),
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
                  _submit(nameTextController.text,stateTextController.text,addressTextController.text,hotlineTextController.text,latTextController.text,longTextController.text);
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