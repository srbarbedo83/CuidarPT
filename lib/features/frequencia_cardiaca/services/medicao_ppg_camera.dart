import 'dart:async';

import 'package:camera/camera.dart';

import 'fonte_frequencia_cardiaca.dart';
import 'processador_ppg.dart';

/// Mede a frequência cardíaca por fotopletismografia (PPG) usando a câmara
/// traseira e o flash: com o dedo bem esticado a tapar a lente e o flash
/// ligado, a luminosidade captada varia ligeiramente a cada batimento.
///
/// Implementa [FonteFrequenciaCardiaca] — ver essa classe para o porquê da
/// separação entre "fonte de dados" e o algoritmo em [ProcessadorPpg].
class MedicaoPpgCamera implements FonteFrequenciaCardiaca {
  MedicaoPpgCamera({ProcessadorPpg? processador}) : _processador = processador ?? ProcessadorPpg();

  final ProcessadorPpg _processador;
  CameraController? _controller;
  StreamController<ResultadoPpg>? _saida;
  DateTime? _inicio;
  bool _aProcessarFrame = false;
  bool _aParar = false;

  @override
  Stream<ResultadoPpg> iniciar() {
    final saida = StreamController<ResultadoPpg>();
    _saida = saida;
    _aParar = false;
    unawaited(_abrirCamara());
    return saida.stream;
  }

  Future<void> _abrirCamara() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        _emitir(const ResultadoPpg.erro('Este dispositivo não tem câmara disponível.'));
        return;
      }
      final traseira = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        traseira,
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      await controller.initialize();
      if (_aParar) {
        await controller.dispose();
        return;
      }

      try {
        await controller.setFlashMode(FlashMode.torch);
      } catch (_) {
        // Alguns dispositivos não têm flash — a medição ainda pode
        // funcionar com boa luz ambiente, só menos fiável.
      }

      _controller = controller;
      _processador.reiniciar();
      _inicio = DateTime.now();
      await controller.startImageStream(_processarFrame);
    } catch (erro) {
      _emitir(ResultadoPpg.erro('Não foi possível aceder à câmara: $erro'));
    }
  }

  void _processarFrame(CameraImage imagem) {
    if (_aProcessarFrame || _aParar) return;
    _aProcessarFrame = true;
    try {
      final inicio = _inicio;
      if (inicio == null) return;

      final luminancia = _luminanciaMedia(imagem);
      final agora = DateTime.now();
      _processador.adicionarAmostra(
        AmostraPpg(tempo: agora.difference(inicio), intensidade: luminancia),
      );

      final resultado = _processador.calcularResultado();
      _emitir(resultado);

      if (resultado.status == StatusPpg.concluido || resultado.status == StatusPpg.erro) {
        unawaited(parar());
      }
    } finally {
      _aProcessarFrame = false;
    }
  }

  /// O plano Y do formato YUV420 já é a luminância de cada pixel — basta
  /// fazer a média. Amostra 1 em cada 4 bytes para poupar CPU: a resolução
  /// já é baixa e não é preciso precisão pixel-a-pixel para este cálculo.
  double _luminanciaMedia(CameraImage imagem) {
    final planoY = imagem.planes.first.bytes;
    if (planoY.isEmpty) return 0;

    const passo = 4;
    var soma = 0;
    var contagem = 0;
    for (var i = 0; i < planoY.length; i += passo) {
      soma += planoY[i];
      contagem++;
    }
    return contagem == 0 ? 0 : soma / contagem;
  }

  void _emitir(ResultadoPpg resultado) {
    final saida = _saida;
    if (saida != null && !saida.isClosed) saida.add(resultado);
  }

  @override
  Future<void> parar() async {
    _aParar = true;
    final controller = _controller;
    _controller = null;
    if (controller != null) {
      try {
        if (controller.value.isStreamingImages) {
          await controller.stopImageStream();
        }
        await controller.setFlashMode(FlashMode.off);
      } catch (_) {
        // Ignora erros ao desligar — o controller vai ser descartado a seguir.
      }
      await controller.dispose();
    }
    final saida = _saida;
    _saida = null;
    if (saida != null && !saida.isClosed) await saida.close();
  }
}
