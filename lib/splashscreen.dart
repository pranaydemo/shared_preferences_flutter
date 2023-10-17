import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_flutter/homepageafterlogin.dart';
import 'package:shared_preferences_flutter/loginpage.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYVALUE="login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wheretoGO();
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageAfterLogin(),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(child: Text("Splash Screen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 45,fontStyle: FontStyle.italic),)),
      ),
    );
  }

 /* void wheretoGO() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageAfterLogin(),));
    });
  }
*/
  void wheretoGO() async{
    var sharedpreferences=await SharedPreferences.getInstance();
    var isLogin=sharedpreferences.getBool(KEYVALUE);

    Timer(Duration(seconds: 5), () {
      if(isLogin!=null){
        if(isLogin){
          Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => HomePageAfterLogin(),));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }
    });
  }
}