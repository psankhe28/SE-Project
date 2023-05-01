import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> generatePdf(String fileName) async {
  final  pdf = pw.Document();

  pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: <pw.Widget>[
            pw.Text("Hello World"),
            pw.Container(
              height: 100,
              width: 100,
              color: PdfColors.yellow,
            ),
          ],
        );
      }));

  final String pdfFile = "$fileName.pdf";

  final  file = File(pdfFile);
  file.writeAsBytesSync(pdf.save() as List<int>);
}