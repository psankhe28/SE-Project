import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PDFGenerationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Generation"),
      ),
      body: Center(
        child: TextButton(
          child: Text("Generate PDF"),
          onPressed: () async {
            await generatePdf("my_pdf");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("PDF generated"),
                  content: Text("The PDF has been generated successfully!"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> generatePdf(String fileName) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
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

    final Uint8List pdfBytes = await pdf.save();

    final Directory? extDir = await getExternalStorageDirectory();
    final String pdfPath = "${extDir!.path}/$fileName.pdf";

    final File file = File(pdfPath);
    file.writeAsBytesSync(pdfBytes);
    print(pdfBytes);
  }
}
