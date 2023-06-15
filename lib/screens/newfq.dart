import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class newfqScreen extends StatefulWidget {

  @override
  _newfqScreenState createState() => _newfqScreenState();
}

class _newfqScreenState extends State<newfqScreen> {
  var answerTextController =  TextEditingController();
  var questionTextController =  TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _submit(question,answer) async {
    var data = {
      "action": "newfq",
      "question":question,
      "answer":answer
    };
    var returnData = await dioHttpPostRequest(context,data,"newfq.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        answerTextController.text="";
        questionTextController.text="";


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
        title: Text("New FAQ"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 4,
                controller: questionTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Answer',
                    hintText: 'Answer'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 4,
                controller: answerTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Question',
                    hintText: 'Question'),
              ),
            ),
            SizedBox(height: 10,),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () {
                  _submit(answerTextController.text,questionTextController.text);
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