import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class updatefaqScreen extends StatefulWidget {

  final String fqID,fqQuestion,fqAnswer;
  updatefaqScreen({Key? key, required this.fqID, required this.fqQuestion, required this.fqAnswer}) : super(key: key);


  @override
  _updatefaqScreenState createState() => _updatefaqScreenState();
}

class _updatefaqScreenState extends State<updatefaqScreen> {
  var questionTextController =  TextEditingController();
  var answerTextController =  TextEditingController();

  @override
  void initState() {
    super.initState();
    questionTextController.text=widget.fqQuestion;
    answerTextController.text=widget.fqAnswer;
  }

  _submit(fqID,fqQuestion,fqAnswer) async {
    var data = {
      "action": "updatefq",
      "fqID":fqID,
      "fqQuestion":fqQuestion,
      "fqAnswer":fqAnswer
    };
    var returnData = await dioHttpPostRequest(context,data,"updatefq.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => super.widget));

        screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);


      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);



      }


    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update FAQ"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: questionTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Question',
                    hintText: 'Question'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: answerTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Answer',
                    hintText: 'Answer'),
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

                  _submit(widget.fqID,questionTextController.text,answerTextController.text);
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