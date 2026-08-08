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
import '../../../data/models/registo_sinais_vitais.dart';
import '../../../l10n/app_localizations.dart';
import 'seccoes_relatorio.dart';

final _formatoData = DateFormat('dd/MM/yyyy');
final _formatoDataHora = DateFormat('dd/MM/yyyy HH:mm');

/// Monta o relatório PDF de cuidados de um idoso para um período, no idioma
/// atual da app (l10n).
class RelatorioPdfBuilder {
  RelatorioPdfBuilder._();

  static Future<Uint8List> construir({
    required AppLocalizations l10n,
    required Idoso idoso,
    required DateTime inicio,
    required DateTime fim,
    required List<RegistoMedicacao> medicacoesAtivas,
    required List<RegistoConsulta> consultas,
    required List<RegistoCuidadoDiario> cuidados,
    List<RegistoSinaisVitais> sinaisVitais = const [],
    Set<SeccaoRelatorio> seccoes = const {
      SeccaoRelatorio.sinaisVitais,
      SeccaoRelatorio.cuidados,
      SeccaoRelatorio.notas,
    },
    String? cuidadorNome,
    Uint8List? logoBytes,
  }) async {
    final documento = pw.Document();

    documento.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          _cabecalho(
            l10n: l10n,
            idoso: idoso,
            inicio: inicio,
            fim: fim,
            cuidadorNome: cuidadorNome,
            logoBytes: logoBytes,
          ),
          pw.SizedBox(height: 20),
          _secaoMedicacao(l10n, medicacoesAtivas),
          pw.SizedBox(height: 16),
          _secaoConsultas(l10n, consultas),
          if (seccoes.contains(SeccaoRelatorio.sinaisVitais)) ...[
            pw.SizedBox(height: 16),
            _secaoSinaisVitais(l10n, sinaisVitais),
          ],
          if (seccoes.contains(SeccaoRelatorio.cuidados)) ...[
            pw.SizedBox(height: 16),
            _secaoCuidados(l10n, cuidados),
          ],
          if (seccoes.contains(SeccaoRelatorio.notas) &&
              idoso.notas != null &&
              idoso.notas!.isNotEmpty) ...[
            pw.SizedBox(height: 16),
            _secaoNotas(l10n, idoso.notas!),
          ],
        ],
      ),
    );

    return documento.save();
  }

  static pw.Widget _cabecalho({
    required AppLocalizations l10n,
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
                l10n.relatorioPdfTitulo(idoso.nome),
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 4),
              pw.Text(l10n.relatorioPdfPeriodo(_formatoData.format(inicio), _formatoData.format(fim))),
              pw.Text(l10n.relatorioPdfGeradoEm(_formatoDataHora.format(DateTime.now()))),
              if (cuidadorNome != null && cuidadorNome.isNotEmpty)
                pw.Text(l10n.relatorioPdfCuidador(cuidadorNome)),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _tituloSeccao(String titulo) {
    return pw.Text(titulo, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold));
  }

  static pw.Widget _secaoMedicacao(AppLocalizations l10n, List<RegistoMedicacao> registos) {
    if (registos.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [_tituloSeccao(l10n.relatorioPdfMedicacaoTitulo), pw.Text(l10n.relatorioPdfSemMedicacao)],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao(l10n.relatorioPdfMedicacaoTitulo),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: [
            l10n.relatorioPdfColunaMedicamento,
            l10n.relatorioPdfColunaDose,
            l10n.relatorioPdfColunaVia,
            l10n.relatorioPdfColunaHorarios,
            l10n.relatorioPdfColunaDias,
          ],
          data: registos
              .map((registo) => [
                    registo.nomeMedicamento,
                    registo.dose ?? '-',
                    registo.viaAdministracao ?? '-',
                    registo.horariosMinutos.map(formatarHorario).join(', '),
                    formatarDiasSemana(l10n, registo.diasSemana),
                  ])
              .toList(),
          cellStyle: const pw.TextStyle(fontSize: 10),
          headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  static pw.Widget _secaoConsultas(AppLocalizations l10n, List<RegistoConsulta> consultas) {
    if (consultas.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _tituloSeccao(l10n.relatorioPdfConsultasTitulo),
          pw.Text(l10n.relatorioPdfSemConsultas),
        ],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao(l10n.relatorioPdfConsultasTitulo),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: [
            l10n.relatorioPdfColunaTipo,
            l10n.relatorioPdfColunaData,
            l10n.relatorioPdfColunaEspecialidade,
            l10n.relatorioPdfColunaLocal,
            l10n.relatorioPdfColunaProfissional,
            l10n.relatorioPdfColunaNotas,
          ],
          data: consultas
              .map((consulta) => [
                    consulta.tipo == TipoRegistoConsulta.tratamento
                        ? l10n.consultaFormTipoTratamento
                        : l10n.relatorioPdfTipoConsulta,
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

  static pw.Widget _secaoCuidados(AppLocalizations l10n, List<RegistoCuidadoDiario> cuidados) {
    if (cuidados.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _tituloSeccao(l10n.relatorioPdfCuidadosTitulo),
          pw.Text(l10n.relatorioPdfSemCuidados),
        ],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao(l10n.relatorioPdfCuidadosTitulo),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: [
            l10n.relatorioPdfColunaData,
            l10n.relatorioPdfColunaTipo,
            l10n.tipoCuidadoHumor,
            l10n.relatorioPdfColunaNota,
          ],
          data: cuidados
              .map((registo) => [
                    _formatoDataHora.format(registo.timestamp),
                    tipoCuidadoDiarioLabel(l10n, registo.tipo),
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

  static pw.Widget _secaoSinaisVitais(AppLocalizations l10n, List<RegistoSinaisVitais> registos) {
    if (registos.isEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _tituloSeccao(l10n.relatorioPdfSinaisVitaisTitulo),
          pw.Text(l10n.relatorioPdfSemSinaisVitais),
        ],
      );
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao(l10n.relatorioPdfSinaisVitaisTitulo),
        pw.SizedBox(height: 6),
        pw.TableHelper.fromTextArray(
          headers: [
            l10n.relatorioPdfColunaData,
            l10n.relatorioPdfColunaPressao,
            l10n.relatorioPdfColunaTemp,
            l10n.sinaisVitaisHistoricoGlicemia,
            l10n.relatorioPdfColunaFreqCardiaca,
            l10n.sinaisVitaisHistoricoPeso,
          ],
          data: registos
              .map((registo) => [
                    _formatoDataHora.format(registo.timestamp),
                    registo.pressaoSistolica != null && registo.pressaoDiastolica != null
                        ? '${registo.pressaoSistolica}/${registo.pressaoDiastolica} mmHg'
                        : '-',
                    registo.temperatura != null ? '${registo.temperatura}°C' : '-',
                    registo.glicemia != null ? '${registo.glicemia} mg/dL' : '-',
                    registo.frequenciaCardiaca != null ? '${registo.frequenciaCardiaca} bpm' : '-',
                    registo.peso != null ? '${registo.peso} kg' : '-',
                  ])
              .toList(),
          cellStyle: const pw.TextStyle(fontSize: 10),
          headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  static pw.Widget _secaoNotas(AppLocalizations l10n, String notas) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _tituloSeccao(l10n.sinaisVitaisFormNotas),
        pw.SizedBox(height: 6),
        pw.Text(notas),
      ],
    );
  }
}
