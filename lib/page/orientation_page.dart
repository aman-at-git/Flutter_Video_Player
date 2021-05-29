import 'package:flutter/material.dart';
import 'package:flutter_auth/widget/basics/file_player_widget.dart';
import 'package:flutter/services.dart';

class OrientationPage extends StatefulWidget {
  @override
  _OrientationPageState createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body:FilePlayerWidget()
  );
}