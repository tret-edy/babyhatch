import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:babyhatch/utils/function.dart';
import 'package:babyhatch/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:babyhatch/screens/root_app.dart';
import 'package:babyhatch/screens/signup.dart';
import 'package:babyhatch/theme/color.dart';

class Signin extends StatefulWidget {

  Signin({Key? key}) : super(key: key);
  //MenuOption(this.title,this.imageUrl,this.discount);

  @override
  _SigninState createState() => _SigninState();
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}


class _SigninState extends State<Signin> {
  bool _visible = true;
  var phonenoTextController =  TextEditingController();
  var passwordTextController =  TextEditingController();

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  late bool _canCheckBiometrics;
  late List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;



  @override
  void initState() {
    super.initState();
    phonenoTextController.text="";
    passwordTextController.text="";
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
  }


  _submitlogin(paramphone,parampass) async {
    var data = {
      "action": "login",
      "user_phone":paramphone,
      "user_password":parampass
    };
    var returnData = await dioHttpPostRequest(context,data,"login.php",1,"Please wait..","brewing data..");
    print("xxxdsdsdsxxx");
    print(returnData);
    print("xxxdsdsdsdxxx");
    Navigator.pop(context);

    if(returnData!="errorException"){

      if(returnData['status']==true){
        String username=returnData['username'].toString();
        String user_type=returnData['user_type'].toString();
        print("oooooottttooooooo");
        print(username);

        await setlocalMemoryData("string","username",username);
        await setlocalMemoryData("string","user_type",user_type);


        Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RootApp())

                                    );

      }else{
        screenLoadingx(context,"",returnData['msgtxt'].toString(),true,true,false);


      }


    }



  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,//appBgColor,//const Color(0xffeeeee4),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,// appBgColor,//Color(0xffeeeee4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09),
                  child: Image.asset("assets/orphancarelogo.png"),
                ),


                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffeeeee4),//Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      ),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextField(
                        controller: phonenoTextController ,
                        cursorColor: cofeehight,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(Icons.mail,color: cofeehight,),
                          hintText: "Username",
                          labelText: "Username",
                          focusColor: cofeehight,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          filled: false,
                          border: InputBorder.none,
                          //border: OutlineInputBorder(),
                        ),
                      ),
                    )


                ),



                const SizedBox(
                  height: 10,
                ),


                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffeeeee4),//Colors.white,
                    border: Border.all(
                        width: 1,
                        color: Colors.white
                    ),

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      controller: passwordTextController,
                      cursorColor: cofeehight,
                      style: const TextStyle(color: Colors.black),
                      obscureText: _visible,
                      decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black
                          ),
                          isCollapsed: false,
                          hintText: "Password",
                          labelText: "Password",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          filled: false,
                          border: InputBorder.none,
                          icon: const Icon(Icons.lock,color: cofeehight),
                          suffixIcon: IconButton(
                              color: cofeehight,
                              padding: const EdgeInsets.all(0),
                              icon: Icon(
                                  _visible ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _visible = !_visible;
                                });
                              })
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),


                Container(
                    height: 50,
                    child: Row(
                        children : <Widget>[
                          Expanded(
                            child:SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () {


                                  _submitlogin(phonenoTextController.text,passwordTextController.text);

                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 200,//MediaQuery.of(context).size.height * 0.07,
                                  margin: const EdgeInsets.only(left: 20,right: 20),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFCB3F),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    ),

                                  ),
                                  /*decoration: BoxDecoration(
                                            color: Color(0xFFFFCB3F),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),*/
                                  child: const Center(
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: cofeehight,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),


                        ])
                ),
                const SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "Don't Have an account? ",
                          style: TextStyle(
                              color: cofeehight.withOpacity(0.8), fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(color: cofeehight, fontSize: 16,fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup())

                                    );
                                    print("Sign Up click");
                                  }),
                          ]),
                    ),
                    ],
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text.rich(
                      TextSpan(
                          text: "Don't want to create an account?",
                          style: TextStyle(
                              color: cofeehight.withOpacity(0.8), fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Login as Guest",
                                style: const TextStyle(color: cofeehight, fontSize: 16,fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RootApp())

                                    );
                                    print("Sign Up click");
                                  }),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    required Key key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  late bool isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade, // color of tick Mark
              activeColor: cofeehight,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
              text: "Remember me",
              style: TextStyle(color: cofeehight.withOpacity(0.8), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}





