import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../common/camera_view.dart';
import 'object_detector_painter.dart';

class ObjectDetectorView extends StatefulWidget {
  const ObjectDetectorView({Key? key}) : super(key: key);
  static const routeName = '/object_detector_view';
  @override
  _ObjectDetectorView createState() => _ObjectDetectorView();
}

class _ObjectDetectorView extends State<ObjectDetectorView> {
  LocalModel model = LocalModel("object_labeler.tflite");
  late ObjectDetector objectDetector;

  @override
  void initState() {
    objectDetector = GoogleMlKit.vision.objectDetector(
        CustomObjectDetectorOptions(model,
            trackMutipleObjects: true, classifyObjects: true));
    super.initState();
  }

  bool isBusy = false;
  CustomPaint? customPaint;

  @override
  void dispose() {
    objectDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Object Detector',
      customPaint: customPaint,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.back,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final result = await objectDetector.processImage(inputImage);
    print(result);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null &&
        result.length > 0) {
      final painter = ObjectDetectorPainter(
          result,
          inputImage.inputImageData!.imageRotation,
          inputImage.inputImageData!.size);
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
