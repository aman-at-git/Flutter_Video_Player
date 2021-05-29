import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/widget/other/floating_action_button_widget.dart';
import 'package:flutter_auth/widget/orientation/video_player_both_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class FilePlayerWidget extends StatefulWidget {
  @override
  _FilePlayerWidgetState createState() => _FilePlayerWidgetState();
}

final urlLandscapeVideo =
    'https://www.youtube.com/watch?v=HSAa9yi0OMA';


class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  final File file = File(
      '/data/user/0/com.example.video_example/cache/file_picker/big_buck_bunny_720p_10mb.mp4');
  VideoPlayerController controller;

  final textController = TextEditingController(text: urlLandscapeVideo);
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    if (file.existsSync()) {
      controller = VideoPlayerController.file(file)
        ..addListener(() => setState(() {}))
        ..setLooping(true)
        ..initialize().then((_) => controller.play());
    }
    else{
      controller = VideoPlayerController.network(textController.text)
        ..addListener(() => setState(() {}))
        ..setLooping(true)
        ..initialize().then((_) => controller.play());
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(toolbarHeight: 0),
    body: Column(
      children: [
        VideoPlayerBothWidget(controller: controller),
        buildAddButton(),
      ],
    ),
  );

  Widget buildAddButton() => Container(
    padding: EdgeInsets.all(32),
    child: FloatingActionButtonWidget(
      onPressed: () async {
        final file = await pickVideoFile();
        if (file == null) return;

        controller = VideoPlayerController.file(file)
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) {
            controller.play();
            setState(() {});
          });
      },
    ),
  );

  Future<File> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) return null;

    return File(result.files.single.path);
  }
}