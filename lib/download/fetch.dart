import 'package:firebase_storage/firebase_storage.dart';

Future<void> fetchPdf(String fileName) async {
  final storageRef = FirebaseStorage.instance.ref();
  final pdfUrl = await storageRef.getDownloadURL();
  
  // Do something with the URL (e.g. open it in a WebView)
}