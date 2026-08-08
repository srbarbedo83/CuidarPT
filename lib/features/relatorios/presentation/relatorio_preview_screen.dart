import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../l10n/app_localizations.dart';

/// Mostra o PDF gerado com pré-visualização nativa, e botões de
/// impressão/partilha (WhatsApp, email, ...) já incluídos pelo pacote
/// `printing`.
class RelatorioPreviewScreen extends StatelessWidget {
  const RelatorioPreviewScreen({
    super.key,
    required this.nomeFicheiro,
    required this.gerarPdf,
    this.emailsPartilha,
  });

  final String nomeFicheiro;
  final Future<Uint8List> Function(PdfPageFormat formato) gerarPdf;

  /// Pré-preenche os destinatários quando o utilizador tocar em partilhar
  /// (ex.: abre o cliente de email já com o "Para" preenchido).
  final List<String>? emailsPartilha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).relatorioPreviewTitulo)),
      body: PdfPreview(
        build: gerarPdf,
        pdfFileName: nomeFicheiro,
        canChangePageFormat: false,
        canChangeOrientation: false,
        shareActionExtraEmails: emailsPartilha,
      ),
    );
  }
}
