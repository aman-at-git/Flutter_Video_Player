import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

  login()async{
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email,
            password: _password
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showError('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showError('Wrong password provided for that user.');
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
                child: Image( image: AssetImage('assets/login.png'),
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
                        height: 20,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: login,
                        child: Text('Login',
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
}
