import 'package:flutter/material.dart';
import 'package:tst/api/pdf_api.dart';
import 'package:tst/api/pdf_paragraph_api.dart';
import 'package:tst/main.dart';
import 'package:tst/page/texto.dart';
import 'package:tst/widget/button_widget.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonWidget(
                  text: 'Simple PDF',
                  onClicked: () async {
                    final pdfFile =
                        await PdfApi.generateCenteredText(sign, base64);

                    PdfApi.openFile(pdfFile);
                  },
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Paragraphs PDF',
                  onClicked: () async {
                    final pdfFile = await PdfParagraphApi.generate();

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
