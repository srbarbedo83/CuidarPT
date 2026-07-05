import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

/// Mostra o PDF gerado com pré-visualização nativa, e botões de
/// impressão/partilha (WhatsApp, email, ...) já incluídos pelo pacote
/// `printing`.
class RelatorioPreviewScreen extends StatelessWidget {
  const RelatorioPreviewScreen({super.key, required this.nomeFicheiro, required this.gerarPdf});

  final String nomeFicheiro;
  final Future<Uint8List> Function(PdfPageFormat formato) gerarPdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatório')),
      body: PdfPreview(
        build: gerarPdf,
        pdfFileName: nomeFicheiro,
        canChangePageFormat: false,
        canChangeOrientation: false,
      ),
    );
  }
}
