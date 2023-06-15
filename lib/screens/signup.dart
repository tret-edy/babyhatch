import 'package:flutter/material.dart';
import 'package:babyhatch/utils/colors.dart';
import 'package:babyhatch/utils/function.dart';
import 'package:babyhatch/screens/login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  var namaTextController =  TextEditingController();
  var emailTextController =  TextEditingController();
  var usernameTextController =  TextEditingController();
  var passwordTextController =  TextEditingController();

  void initState() {
    super.initState();

  }

  _submitsignup(nama,email,username,password) async {
    var data = {
      "action": "register",
      "nama":nama,
      "email":email,
      "username":username,
      "password":password
    };
    var returnData = await dioHttpPostRequest(context,data,"register.php",1,"Please wait..","brewing data..");
    print(returnData);
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){


        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Signin())

        );

        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);

      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);



      }


    }



  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color(0xFFFFCB3F),
        title: Text("Daftar Akaun",style: TextStyle(
          fontSize: 18,
          color: cofeehight,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/orphancarelogo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: namaTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                    hintText: 'Nama'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameTextController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
           SizedBox(
             height: 10,
           ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xFFFFCB3F), borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () {
                  _submitsignup(namaTextController.text,emailTextController.text,usernameTextController.text,passwordTextController.text);
                  /* Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));*/
                },
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Signin())

                );
              },
              child: Text('Sudah mempunyai akaun? log masuk'),
            ),


          ],
        ),
      ),
    );
  }
}