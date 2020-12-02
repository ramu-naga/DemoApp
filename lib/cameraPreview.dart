import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewDemo extends StatefulWidget {
  List<CameraDescription> cameras = List();

  CameraPreviewDemo({this.cameras});
  @override
  _CameraPreviewState createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreviewDemo> {
  CameraController cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseCamera();
  }

  initialiseCamera() async {
    cameraController =
        CameraController(widget.cameras.first, ResolutionPreset.medium);

    _initializeControllerFuture = cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CameraPreview(cameraController);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
