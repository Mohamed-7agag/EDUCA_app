import 'dart:convert';
import 'dart:io';

Future<String> fileToString(File file) async {
  // Read file as bytes
  List<int> bytes = await file.readAsBytes();
  
  // Decode bytes to String using utf8 encoding
  String content = utf8.decode(bytes);
  
  return content;
}

Future<File> stringToFile(String content, String filePath) async {
  // Write content to a file
  File file = File(filePath);
  await file.writeAsString(content);
  
  return file;
}