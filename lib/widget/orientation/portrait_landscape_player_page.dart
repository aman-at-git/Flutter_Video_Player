import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/widget/orientation/video_player_both_widget.dart';
import 'package:flutter_auth/widget/orientation/video_player_fullscreen_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

final urlLandscapeVideo =
    'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';

class PortraitLandscapePlayerPage extends StatefulWidget {
  @override
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    controller = VideoPlayerController.network(urlLandscapeVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(toolbarHeight: 0),
    body: VideoPlayerBothWidget(controller: controller),
  );
}