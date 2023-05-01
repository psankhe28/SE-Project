import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'fapi.dart';


class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({

    required this.file,
  });

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
late final FirebaseApi fi;
  
  
  @override
  Widget build(BuildContext context) {

    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor:    Color.fromARGB(255, 76, 76, 175),
        actions: pages >= 2
            ? [
          Center(child: Text(text,style: TextStyle(fontSize: 1),)),
      
          IconButton(
            icon: Icon(Icons.chevron_left, size: 32),
            onPressed: () {
              final page = indexPage == 0 ? pages : indexPage - 1;
              controller.setPage(page);
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, size: 32),
            onPressed: () {
              final page = indexPage == pages - 1 ? 0 : indexPage + 1;
              controller.setPage(page);
            },
          ),

        ]
            : [Center(child: Text(text,style: TextStyle(fontSize: 1),)),
    
    ]
      ),
      body:
    RepaintBoundary(

            child: PDFView(


              filePath: widget.file.path,

              onRender: (pages) => setState(() => this.pages = pages!),
              onViewCreated: (controller) =>
                  setState(() => this.controller = controller),
              onPageChanged: (indexPage, _) =>
                  setState(() => this.indexPage = indexPage!),
            ),

          ),



   
    );
  }
}