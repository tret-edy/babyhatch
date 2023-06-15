import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class newInfoScreen extends StatefulWidget {

  @override
  _newInfoScreenState createState() => _newInfoScreenState();
}

class _newInfoScreenState extends State<newInfoScreen> {
  var titleTextController =  TextEditingController();
  var imgTextController =  TextEditingController();
  var descTextController =  TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _submit(title,img,desc) async {
    var data = {
      "action": "newinfo",
      "title":title,
      "img":img,
      "desc":desc
    };
    var returnData = await dioHttpPostRequest(context,data,"newinfo.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        titleTextController.text="";
        imgTextController.text="";
        descTextController.text="";


        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);

      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);



      }


    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: titleTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    hintText: 'Title'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: imgTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Image Url',
                    hintText: 'Image Url'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 10,
                controller: descTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Description'),
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
                  _submit(titleTextController.text,imgTextController.text,descTextController.text);
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