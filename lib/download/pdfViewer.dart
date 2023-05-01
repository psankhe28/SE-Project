import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
// import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PDFViewer extends StatefulWidget {
  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  late Future<ListResult> futureFiles;
  void initState() {
    super.initState();
    futureFiles = FirebaseStorage.instance.ref('sliderImages').listAll();
  }
 
link(Reference ref) async {
  final url = await downloadFile(ref);
  return url.toString() ; 
}
// Future<Directory> downloadsDirectory = DownloadsPathProvider.downloadsDirectory;
//   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: "Downloads"),
        body: FutureBuilder(
          future: futureFiles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final files = snapshot.data!.items;

              return ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];
                    final url = link(file) ;
                    return Image(image: NetworkImage(url));
                    // return ListTile(
                    //   title: Text("${file.name}"),
                    //   trailing: IconButton(
                    //       onPressed: () {
                    //         downloadFile(file);
                    //       },
                    //       icon: Icon(Icons.download)),
                    // );
                  });
            } else if (snapshot.hasError) {
              return Text("Error Occured");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future downloadFile<String>(Reference ref) async {
    final url = await ref.getDownloadURL();
    return url.toString() ;
    // final dir = await getApplicationDocumentsDirectory();
    // final path = '${dir.path}/${ref.name}';
    // await Dio().download(url, path);
    // // print(file) ;

    // if (url.contains('.jpeg')) {
    //   await GallerySaver.saveImage(path, toDcim: true);
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("file downloaded")));
    // }
  }
}
