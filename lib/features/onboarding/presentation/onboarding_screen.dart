import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../subscricao/providers/subscricao_providers.dart';

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  final IconData icone;
  final String titulo;
  final String descricao;
}

const _slides = [
  _OnboardingSlide(
    icone: Icons.favorite,
    titulo: 'Bem-vindo ao CuidarPT',
    descricao:
        'Organize a medicação, as consultas e os cuidados diários de quem '
        'cuida, tudo num só lugar.',
  ),
  _OnboardingSlide(
    icone: Icons.medication_outlined,
    titulo: 'Registos simples do dia a dia',
    descricao:
        'Medicação com lembretes, consultas médicas e notas rápidas de '
        'higiene, alimentação e humor.',
  ),
  _OnboardingSlide(
    icone: Icons.privacy_tip_outlined,
    titulo: 'Tudo guardado no seu telemóvel',
    descricao:
        'Sem contas nem servidores — os dados ficam só no seu dispositivo. '
        'Comece já com 7 dias grátis de todas as funcionalidades Premium.',
  ),
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  var _paginaAtual = 0;
  var _aIniciar = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _comecar() async {
    setState(() => _aIniciar = true);
    await ref.read(subscricaoRepositoryProvider).iniciarTrialSeNecessario();
  }

  @override
  Widget build(BuildContext context) {
    final ultimaPagina = _paginaAtual == _slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (indice) => setState(() => _paginaAtual = indice),
                itemBuilder: (context, indice) {
                  final slide = _slides[indice];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(slide.icone, size: 96, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 32),
                        Text(
                          slide.titulo,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          slide.descricao,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (indice) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: indice == _paginaAtual ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: indice == _paginaAtual
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _aIniciar
                      ? null
                      : () {
                          if (ultimaPagina) {
                            _comecar();
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                  child: Text(ultimaPagina ? 'Começar' : 'Seguinte'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
