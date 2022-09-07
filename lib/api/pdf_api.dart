import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(
      String assinatura, List<String> pdfBase64) async {
    final pdf = Document();
    Uint8List assinaturaBase = base64Decode(assinatura);
    List<double> heitinho = [150, 300];

    for (int i = 0; i < pdfBase64.length; i++) {
      pdf.addPage(Page(
        build: (context) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(base64Decode(pdfBase64[i])),
                ),
              ),
            ),
            Container(
              height: heitinho[i],
              width: heitinho[i],
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(assinaturaBase),
                ),
              ),
            ),
          ],
        ),
      ));
    }

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
