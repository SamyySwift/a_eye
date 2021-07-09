import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tflite/tflite.dart';

class ClassifierApp extends StatefulWidget {
  @override
  _ClassifierAppState createState() => _ClassifierAppState();
}

class _ClassifierAppState extends State<ClassifierApp> {
  CameraController controller;
  List _recognitions;
  bool isDetecting = false;
  String output = '';

  FlutterTts flutterTts = FlutterTts();

  Future speak() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setPitch(1.0);

    await flutterTts.speak(output);
  }

  @override
  void initState() {
    super.initState();
    initCamera();
    loadModel().then((value) {
      setState(() {});
    });
  }

  void initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    onNewCameraSelected(firstCamera);
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.max,
        enableAudio: false);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (controller.value.hasError) {
        print('camera error');
      }
    });

    try {
      await controller.initialize();
    } catch (e) {
      print(e);
    }
    controller.startImageStream((CameraImage img) async {
      if (!isDetecting) {
        isDetecting = true;
        Tflite.runModelOnFrame(
          bytesList: img.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: img.height,
          imageWidth: img.width,
          numResults: 1,
          threshold: 0.6,
        ).then((recognitions) {
          isDetecting = false;
          _recognitions = recognitions;
          Future.delayed(Duration(seconds: 1));
        });
      }

      output = _recognitions[0]['label'];

      await Future.delayed(Duration(seconds: 2));
      speak();
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/mobilenet_v1_1.0_224.tflite',
        labels: 'assets/mobilenet_v1_1.0_224.txt');
  }

  @override
  void dispose() {
    controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(child: Expanded(child: CameraPreview(controller)));
  }
}
