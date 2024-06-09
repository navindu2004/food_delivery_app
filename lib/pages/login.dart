import 'package:flutter/material.dart';
import 'package:flutterapp_02/widget/widget_support.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF92d6d9),
    Color(0xFF4db7b7),
                  ]
                )
              ),
            ),
            Container(
              margin:
               EdgeInsets.only(top: MediaQuery.of(context).size.height /3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top:60, left: 20, right: 20),
              child: Column(children: [
                Center(child: Image.asset("images/aklogo.jpeg", width: MediaQuery.of(context).size.width/1.5, fit: BoxFit.cover,)),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(children: [
                    Text("Login", style: AppWidget.semiBoldTextFieldStyle(),)
                  ],),
                )
              ],),
            )
      ],),),
    );
  }
}