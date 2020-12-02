import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'cameraPreview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  File pictureSaved;

  List<CameraDescription> cameras = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    findavailableCamera();
  }

  findavailableCamera() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: pictureSaved != null
            ? (Image.file(pictureSaved))
            : Text("No picture capture"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CameraPreviewDemo(cameras: this.cameras,)));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
