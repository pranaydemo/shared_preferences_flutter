import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_flutter/homepageafterlogin.dart';
import 'package:shared_preferences_flutter/loginpage.dart';
import 'package:shared_preferences_flutter/splashscreen.dart';

class LoginPage extends StatelessWidget{
  var usernamecontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Login Page"),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle,color: Colors.blue,size: 100,),
            SizedBox(height: 15,),
            TextField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  // hintText: "UserName",
                  label: Text("UserName"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                  )
                ),
              ),
            SizedBox(height: 20,),
             TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  // hintText: "Password",
                    label: Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)
                    )
                ),
              ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              var sharedpreference=await SharedPreferences.getInstance();
              sharedpreference.setBool(SplashScreenState.KEYVALUE,true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageAfterLogin(),));
            }, child: Text("Login"))

          ],
        ),
      ),
    ),
  );
  }

}