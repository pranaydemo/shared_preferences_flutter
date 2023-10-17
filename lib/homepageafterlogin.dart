import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_flutter/loginpage.dart';
import 'package:shared_preferences_flutter/splashscreen.dart';


class HomePageAfterLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home,color: Colors.blue,size: 200,),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{
              var sharedPref=await SharedPreferences.getInstance();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              sharedPref.setBool(SplashScreenState.KEYVALUE,false);
            }, child: Text("Logout"))
          ],
        ),
      )
    );
  }

}