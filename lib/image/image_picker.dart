import 'dart:io';

import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();

Future<File> getImage() async {
  final pickedFile = await picker.getImage(
    source: ImageSource.camera,
    imageQuality: 70,
  );
  return File(pickedFile.path);
}
