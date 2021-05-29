import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/page/orientation_page.dart';
import 'Start.dart';
import 'Profile.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoggedIn = false;

  checkAuth() async {
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Start()), (Route<dynamic> route) => false);
      }
      else{
        isLoggedIn = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: //!isLoggedIn?CircularProgressIndicator():
        Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Container(
              alignment: Alignment(0.95,0),
              child: InkWell(
                onTap: ()=> Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Profile())),
                child:Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xff6C63FF),
                  size: 60,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: Image(image: AssetImage('assets/notplayedanything.png'),),
              height: 300.0,
            ),
            //SizedBox(height: 30,),
            RichText(
              text: TextSpan(
                  text: 'You have not played anything',
                  style: TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6C63FF)
                  )
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Use the play button to play something',
                  style: TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6C63FF)
                  )
              ),
            ),
            SizedBox(height: 220,),
            Column(
              children: [
                Align(
                  alignment: Alignment(0.9,0),
                  child:FloatingActionButton(
                    onPressed: ()=>Navigator.push(
                        context, MaterialPageRoute(builder: (context) => OrientationPage())),
                    child: Icon(Icons.play_arrow_rounded, color: Colors.white,),
                    backgroundColor: Color(0xff6C63FF),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

