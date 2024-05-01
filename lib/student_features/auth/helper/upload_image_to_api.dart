import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToApi(XFile image) async {
  return MultipartFile.fromFile(
    image.path,
    filename: "dp",
  );
}

Future<String?> convertImageToBase64(XFile imageFile) async {
  try {
    // Convert image file to bytes
    List<int> imageBytes = await imageFile.readAsBytes();

    // Encode bytes to base64
    String base64Image = base64Encode(imageBytes);

    // Return base64 encoded string
    return 'data:image/jpeg;base64,$base64Image';
  } catch (e) {
    return null;
  }
}
