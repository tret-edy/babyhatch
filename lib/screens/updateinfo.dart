import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class updateinfographicScreen extends StatefulWidget {

  final String igID,igName,igImage,igDesc;
  updateinfographicScreen({Key? key, required this.igID, required this.igName, required this.igImage, required this.igDesc}) : super(key: key);


  @override
  _updateinfographicScreenState createState() => _updateinfographicScreenState();
}

class _updateinfographicScreenState extends State<updateinfographicScreen> {
  var titleTextController =  TextEditingController();
  var imgTextController =  TextEditingController();
  var descTextController =  TextEditingController();

  @override
  void initState() {
    super.initState();
     titleTextController.text=widget.igName;
     imgTextController.text=widget.igImage;
     descTextController.text=widget.igDesc;
  }

  _submit(igID,igName,igImage,igDesc) async {
    var data = {
      "action": "updateinfo",
      "igID":igID,
      "igName":igName,
      "igImage":igImage,
      "igDesc":igDesc
    };
    var returnData = await dioHttpPostRequest(context,data,"updateinfo.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        Navigator.pop(context);

        screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);

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
                  _submit(widget.igID,titleTextController.text,imgTextController.text,descTextController.text);
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