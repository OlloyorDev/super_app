import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/src/receipts/presentation/bloc/receipts_bloc.dart';
import 'package:super_app/src/receipts/presentation/screens/receipts_screen.dart';

mixin ReceiptsMixin on State<ReceiptsScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  void initCamera() {
    context
        .read<ReceiptsBloc>()
        .add(const OpenCameraEvent(cameraStatus: CameraStatus.loading));
    availableCameras().then((cameras) {
      if (cameras.isNotEmpty) {
        _controller =
            CameraController(cameras.first, ResolutionPreset.ultraHigh);
        _initializeControllerFuture = _controller.initialize().then((_) {
          setState(() {}); // Trigger a rebuild after initialization
        });
      }
    });
    context
        .read<ReceiptsBloc>()
        .add(const OpenCameraEvent(cameraStatus: CameraStatus.on));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
