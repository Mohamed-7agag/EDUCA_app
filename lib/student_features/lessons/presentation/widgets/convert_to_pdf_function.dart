import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> convertToPDF(
    {required String base64Content, required String fileName}) async {
  // Decode the Base64 content
  List<int> bytes = base64.decode(base64Content);

  // Get the application documents directory
  Directory directory = await getApplicationDocumentsDirectory();

  // Create a file to save the PDF content
  File file = File('${directory.path}/$fileName');

  // Write the bytes to the file
  await file.writeAsBytes(bytes);
  print(file.path);

  // Open the PDF file
  OpenFile.open(file.path).then((result) {
    print('OpenFile result: ${result.message}');
  }).catchError((error) {
    print('OpenFile error: $error');
  });
}
