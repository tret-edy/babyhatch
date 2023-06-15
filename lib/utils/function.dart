//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:babyhatch/utils/url_source.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> Calllauchurl(paramurl) async {
  if (!await launchUrl(Uri.parse(paramurl))) {
    throw 'Could not launch $paramurl';
  }
}


Future<String> checkingConnection() async
{
  var statusReturn="";
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      statusReturn ="1";
      return statusReturn;
    }
  } on SocketException catch (_) {
    statusReturn ="0";
    return statusReturn;

  }
  return statusReturn;

}

dioHttpPostRequest(context,dataPost,action,loading,title,desc) async {
  print("zzzzzz");
  String c =mainUrl+action;
  print(c);
  var connection = await checkingConnection();
  if(connection=="1"){
    if(loading==1){
      screenLoadingx(context,title,desc,false,false,true);
    }

    BaseOptions options = BaseOptions(
      connectTimeout: 30000,//5000,
      receiveTimeout: 30000,//3000,
    );
    Dio dio = new Dio(options);
    //dio.options.headers["Authorization"] ;//= "Bearer $bearerToken";

    print(c);
    try {
      Response res = await dio.post(mainUrl+action, data:FormData.fromMap(dataPost),) ;

      var rawData = json.decode(res.toString());

//print(c);

      /* if(loading==1){
        Navigator.of(context, rootNavigator: true).pop();
      }*/
      rawData.addAll({"errorhandle": true});

      return rawData;

    } catch (e) {
     // final errorMessage = DioExceptions.fromDioError(e);

      if(loading==1){
        Navigator.of(context, rootNavigator: true).pop();
      }
      //screenLoadingx(context,"Error Message",errorMessage.toString(),true,true,false);
      //print(errorMessage.toString());
      return "errorException";
    }



  }else{
    screenLoadingx(context,"Error Message","No internet connection".toString(),true,true,false);
    return "errorException";
  }






}


/*class DioExceptions implements Exception {

  DioExceptions.fromDioError(DioError dioError) {

    switch (dioError.type) {
      case  DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response.statusCode, dioError.response.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }


  String message;
  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return '400 Error-Bad request';
      case 404:
        return '404 Error-Script not found';//error["message"];
      case 500:
        return '500 Error-Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}*/


Future<void> screenLoadingx(BuildContext context,title,desc,bool isclose,bool overlay,bool spin) async {

  Alert(
      context: context,
      title: title,
      desc: desc,
      content: Padding(padding: EdgeInsets.all(5.0),
        child: spin==true ?
        /*Image.asset(
          "assets/images/loading.gif",
          height: 225.0,
          width: 225.0,
        )*/
        CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)
        ):Text("~~"),
      ),
      style: AlertStyle(
          isCloseButton: isclose,
          isOverlayTapDismiss: overlay,
          titleStyle: TextStyle(fontFamily: 'raleway', fontWeight: FontWeight.bold),
          descStyle: TextStyle(fontFamily: 'raleway', fontSize: 15.0),
          alertBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
      ),
      buttons: []
  ).show();

}

Widget shimmerItem(BuildContext context){
  return Container(
    child:
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,//grey.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/bank.png",//daily[index]['icon'],
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                /*Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),*/

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(

                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(

                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),

                      ),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.8,
                ),
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),

    ),


  );
}


Widget shimmerLoading(BuildContext context){
  return Container(
    child:
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,//grey.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/bank.png",//daily[index]['icon'],
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                /*Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),*/

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(

                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(

                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),

                      ),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.8,
                ),
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),

    ),


  );
}



setlocalMemoryData(String typeSet,key,value) async{
  SharedPreferences localSet = await SharedPreferences.getInstance();
  if(typeSet=="string"){
    localSet.setString(key, value);
  }
  else
  if(typeSet=="int"){
    localSet.setInt(key, value);
  }
  else
  if(typeSet=="bool"){
    localSet.setBool(key, value);
  }
  else
  if(typeSet=="stringList"){
    localSet.setStringList(key, value);
  }
  else
  if(typeSet=="double"){
    localSet.setDouble(key, value);
  }

}

