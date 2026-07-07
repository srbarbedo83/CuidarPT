import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/utils/horarios.dart';
import '../../../core/utils/tipo_cuidado_diario_utils.dart';
import '../../../data/models/idoso.dart';
import '../../../data/models/registo_consulta.dart';
import '../../../data/models/registo_cuidado_diario.dart';
import '../../../data/models/registo_medicacao.dart';

final _formatoData = DateFormat('dd/MM/yyyy');
final _formatoDataHora = DateFormat('dd/MM/yyyy HH:mm');

/// Monta o relatório PDF de cuidados de um idoso para um período.
class RelatorioPdfBuilder {
  RelatorioPdfBuilder._();

  static Future<Uint8List> construir({
    required Idoso idoso,
    required DateTime inicio,
    required DateTime fim,
    required List<RegistoMedicacao> medicacoesAtivas,
    required List<RegistoConsulta> consultas,
    required List<RegistoCuidadoDiario> cuidados,
    String? cuidadorNome,
    Uint8List? logoBytes,
  }) async {
    final documento = pw.Document();

    documento.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          _cabecalho(idoso: idoso, inicio: inicio, fim: fim, cuidadorNome: cuidadorNome, logoBytes: logoBytes),
          pw.SizedBox(height: 20),
          _secaoMedicacao(medicacoesAtivas),
          pw.SizedBox(height: 16),
          _secaoConsultas(consultas),
          pw.SizedBox(height: 16),
          _secaoCuidados(cuidados),
        ],
      ),
    );

    return documento.save();
  }

  static pw.Widget _cabecalho({
    required Idoso idoso,
    required DateTime inicio,
    required DateTime fim,
    String? cuidadorNome,
    Uint8List? logoBytes,
  }) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        if (logoBytes != null)
          pw.Container(
            width: 56,
            height: 56,
            margin: const pw.EdgeInsets.only(right: 16),
            child: pw.Image(pw.MemoryImage(logoBytes)),
          ),
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Relatório de cuidados - ${idoso.nome}',
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 4),
              pw.Text('Período: ${_formatoData.format(inicio)} a ${_formatoData.format(fim)}'),
              pw.Text('Gerado em: ${_formatoDataHora.format(DateTime.now())}'),
              if (cuidadorNome != null && cuidadorNome.isNotEmpty) pw.Text('Cuidador: $cuidadorNome'),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _tituloSeccao(String titulo) {
    return pw.Text(titulo, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold));
  }

  static pw.Widget _secaoMedicacao(List<RegistoMedicacao> registos) {
    if (registos.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [_tituloSeccao('Medicação atual'), pw.Text('Sem medicação ativa registada.')],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao('Medicação atual'),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: ['Medicamento', 'Dose', 'Horários', 'Dias'],
          data: registos
              .map((registo) => [
                    registo.nomeMedicamento,
                    registo.dose ?? '-',
                    registo.horariosMinutos.map(formatarHorario).join(', '),
                    formatarDiasSemana(registo.diasSemana),
                  ])
              .toList(),
          cellStyle: const pw.TextStyle(fontSize: 10),
          headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  static pw.Widget _secaoConsultas(List<RegistoConsulta> consultas) {
    if (consultas.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _tituloSeccao('Consultas e tratamentos no período'),
          pw.Text('Sem consultas ou tratamentos registados no período.'),
        ],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao('Consultas e tratamentos no período'),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: ['Tipo', 'Data', 'Especialidade/Tratamento', 'Local', 'Profissional', 'Notas'],
          data: consultas
              .map((consulta) => [
                    consulta.tipo == TipoRegistoConsulta.tratamento ? 'Tratamento' : 'Consulta',
                    _formatoDataHora.format(consulta.dataHora),
                    consulta.especialidade,
                    consulta.local ?? '-',
                    consulta.nomeMedico ?? '-',
                    consulta.notas ?? '-',
                  ])
              .toList(),
          cellStyle: const pw.TextStyle(fontSize: 10),
          headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  static pw.Widget _secaoCuidados(List<RegistoCuidadoDiario> cuidados) {
    if (cuidados.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _tituloSeccao('Cuidados diários no período'),
          pw.Text('Sem cuidados diários registados no período.'),
        ],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao('Cuidados diários no período'),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: ['Data', 'Tipo', 'Humor', 'Nota'],
          data: cuidados
              .map((registo) => [
                    _formatoDataHora.format(registo.timestamp),
                    tipoCuidadoDiarioLabel(registo.tipo),
                    registo.humorNivel != null ? '${registo.humorNivel}/5' : '-',
                    registo.notaRapida ?? '-',
                  ])
              .toList(),
          cellStyle: const pw.TextStyle(fontSize: 10),
          headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }
}
