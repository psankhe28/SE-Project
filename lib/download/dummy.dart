// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

// class DownloadPdfPage extends StatefulWidget {
//   @override
//   _DownloadPdfPageState createState() => _DownloadPdfPageState();
// }

// class _DownloadPdfPageState extends State<DownloadPdfPage> {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final String pdfName = 'proposal.pdf';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           child: Text('Download PDF'),
//           onPressed: () async {
//             final  storageReference = _storage.ref('pdfs').child(pdfName);
//             final Directory? downloadDirectory = await getExternalStorageDirectory();
//             final File pdfFile = File("${downloadDirectory!.path}/Download/$pdfName");

//             storageReference.writeToFile(pdfFile).then((value) {
               
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text('PDF downloaded to ${downloadDirectory.path}/Download'),
//               ));
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
