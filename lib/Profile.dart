import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 35, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.deepPurpleAccent,
                      size: 40,
                    ),
                    onPressed:() => Navigator.pop(context, false),
                  ),
                ),
              ),
              Container(
                height: 180,
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xb46C63FF),
                  size: 150,
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Aman Singh',
                    style: TextStyle(fontSize: 25.0,
                        color: Colors.black87
                    )
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0,0),
                    child: RichText(
                      text: TextSpan(
                          text: 'Enable/Disable AI ',
                          style: TextStyle(fontSize: 20.0,
                              color: Colors.black
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Align(
                      child:Switch(
                        value: isSwitched,
                        onChanged: (value){
                          setState(() {
                            isSwitched=value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 0, 15),
                      child: RichText(
                        text: TextSpan(
                            text: 'Change Password',
                            style: TextStyle(fontSize: 20.0,
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Icon(Icons.chevron_right_rounded,size: 40,color: Colors.black),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 0, 15),
                      child: RichText(
                        text: TextSpan(
                            text: 'Change Name',
                            style: TextStyle(fontSize: 20.0,
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Icon(Icons.chevron_right_rounded,size: 40,color: Colors.black),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                      child: RichText(
                        text: TextSpan(
                            text: 'Report an Issue',
                            style: TextStyle(fontSize: 20.0,
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Icon(Icons.chevron_right_rounded,size: 40,color: Colors.black),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                      child: RichText(
                        text: TextSpan(
                            text: 'Change Theme',
                            style: TextStyle(fontSize: 20.0,
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Icon(Icons.chevron_right_rounded,size: 40,color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: _auth.signOut,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 45, color: Colors.deepPurpleAccent,),
                    RichText(
                        text: TextSpan(
                            text: " Logout",
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 18,
                            )
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
