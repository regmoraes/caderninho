import 'package:camera/camera.dart';

// Get a specific camera from the list of available cameras.
Future<CameraDescription> get camera async {
  final cameras = await availableCameras();
  return cameras.first;
}
