import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';
import 'Signup.dart';
import 'HomePage.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuth() async {
    return _auth.authStateChanges().listen((User user) {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          ),
              (route) => false,
        );
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkAuth();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 60.0),
            Container(
              child: Image(image: AssetImage('assets/start.png'),fit: BoxFit.contain,),
            ),
            SizedBox(height: 50.0),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: 'Welcome to \n', style: TextStyle(fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Smart Media Player', style: TextStyle(fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent)
                        )
                      ]
                  )
              ),
            ),
            SizedBox(height: 30.0),
            Align(
              alignment: Alignment.center,
              child: Text('Smartest AI based media player'),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: ()=> Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login())),
                  child: Text('Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.deepPurpleAccent,
                ),
                SizedBox(width: 20),
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: ()=> Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Signup())),
                  child: Text('Register',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.deepPurpleAccent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
