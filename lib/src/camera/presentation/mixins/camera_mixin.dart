import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:super_app/src/camera/presentation/screens/camera_screen.dart';

mixin CameraMixin on State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
