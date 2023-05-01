import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:scholarship_vjti/downloads/file.dart';
import 'package:scholarship_vjti/downloads/page.dart';

import '../widgets/myAppBar.dart';
import 'api.dart';
import 'fapi.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<FirebaseFile>> futureFiles;
  late Future<List<FirebaseFile>> c;
  late FirebaseFile url;
  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('docs/');
  }

  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: MyAppBar(
            title: 'PDF ',
          ),
          body: FutureBuilder<List<FirebaseFile>>(
            future: futureFiles,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    final files = snapshot.data!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index) {
                              final file = files[index];

                              return buildFile(context, file);
                            },
                          ),
                        ),
                      ],
                    );
                  }
              }
            },
          ),
        ),
      );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PDFViewerPage(
            file: file,
          ),
        ),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
      title: Text(
        file.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 76, 76, 175),
        ),
      ),
      trailing: IconButton(
          onPressed: () async {
            print(file.url);
            dFile(file.ref, await file.ref.getDownloadURL());
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Downloaded")));
          },
          icon: Icon(
            Icons.file_download,
              color: Color.fromARGB(255, 76, 76, 175),
          )),
      onTap: () async {
        final url = 'docs/' + file.name;
        final file1 = await PDFApi.loadFirebase(url);
        openPDF(context, file1!);
      });

  // Widget buildHeader(int length) => ListTile(
  //       tileColor: Colors.blue,
  //       leading: Container(
  //         width: 52,
  //         height: 52,
  //         child: Icon(
  //           Icons.file_copy,
  //           color: Colors.white,
  //         ),
  //       ),
  //       title: Text(
  //         '$length Files',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20,
  //           color: Colors.white,
  //         ),
  //       ),
  //     );
  Future dFile(Reference ref, String url) async {
    final file = File('/sdcard/download/${ref.name}');

    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ));
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);

    raf.close();
    return file;
  }
}
