import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';

class Item {
  final String fqID;
  final String fqQuestion;
  final String fqAnswer;
  Item(
      this.fqID,
      this.fqQuestion,
      this.fqAnswer,
      );

  factory Item.fromJson(dynamic json) {
    return Item(
        "${json['fqID']}", "${json['fqQuestion']}", "${json['fqAnswer']}");
  }

  Map toJson() => {
    "fqID": fqID,
    "fqQuestion": fqQuestion,
    "fqAnswer": fqAnswer,
  };
}





class ExpansionItems extends StatefulWidget {
  const ExpansionItems({Key? key}) : super(key: key);

  @override
  State<ExpansionItems> createState() => _ExpansionItemsState();
}

class _ExpansionItemsState extends State<ExpansionItems> {
/*  getFeedbackList() {
    return mylist.map((json) => Item.fromJson(json)).toList();
  }

  final List<Item> _data = getFeedbackList();
  var mylist = [
    {"fqID": "1", "fqQuestion": "question 1", "fqAnswer": "answer 1"},
    {"fqID": "2", "fqQuestion": "question 2", "fqAnswer": "answer 2"}
  ];*/

  late List _data=[];

  void initState() {
    // TODO: implement initState
    super.initState();
    _listfaq();
  }

  _listfaq() async {
    print("masuk sini");
    var data = {
      "action": "listfaq",
    };
    var returnData = await dioHttpPostRequest(context,data,"faq.php",1,"Please wait..","brewing data..");
    print("zzzzzzz");
    print(returnData);
    print("zzzzzzz");
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        print("list bbyghhact");
        print(returnData);
        setState(() {
         _data=returnData['data'];
        });
        print("koko");
        //print(babyhatchdata);
        // Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);



        /* Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RootApp())

        );*/

        // screenLoadingx(context,"",returnData['mesejayat'].toString(),true,true,false);
        //Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

        // _myorder();


      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);


      }


    }



  }



  @override
  Widget build(BuildContext context) {
    print(_data);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            getHeader(),
            _buildPanel(),
          ],
        ),
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
                        child: Text("FAQ",
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

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 2,
      children: List.generate(_data.length,
              (index){

            return ExpansionPanelRadio(
              value: _data[index]['fqID'],
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(_data[index]['fqQuestion']),
                );
              },
              body: ListTile(
                title: Text(_data[index]['fqAnswer']),
              ),
            );
          })
    );
  }

 /* Widget _buildPanel() {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 2,
      children: _data.map<ExpansionPanelRadio>(
            (Item item) {
          return ExpansionPanelRadio(
            value: item.fqID,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.fqQuestion),
              );
            },
            body: ListTile(
              title: Text(item.fqAnswer),
            ),
          );
        },
      ).toList(),
    );
  }*/
}
