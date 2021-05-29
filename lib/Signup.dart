import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _email, _password;
  DatabaseReference mUserDatabase = FirebaseDatabase.instance.reference().child("user");

  signup() async{
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email,
            password: _password
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showError('The account already exists for that email.');
        }
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  showError(String errorMessage){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('OK')
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                child: Image( image: AssetImage('assets/signin.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                            validator: (input){
                              if(input.isEmpty)
                                return 'Enter your name';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person)
                            ),
                            onSaved: (input) => _name=input
                        ),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input){
                              if(input.isEmpty)
                                return 'Enter E-mail';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)
                            ),
                            onSaved: (input) => _email=input
                        ),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input){
                              if(input.length < 6)
                                return 'Password too short';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock)
                            ),
                            obscureText: true,
                            onSaved: (input) => _password=input
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: signup,
                        child: Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pushtodatabase(String email, String password) {
    mUserDatabase.child("user_id").set("value");
    mUserDatabase.child("email").set(email);
    mUserDatabase.child("password").set(password);
  }
}
