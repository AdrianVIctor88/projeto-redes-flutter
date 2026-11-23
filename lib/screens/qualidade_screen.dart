import 'package:flutter/material.dart';

class QualidadeScreen extends StatefulWidget {
  const QualidadeScreen({super.key});

  @override
  State<QualidadeScreen> createState() => _QualidadeScreenState();
}

class _QualidadeScreenState extends State<QualidadeScreen> {
  final List<_ItemChecklist> _itensVerificacao = [
    _ItemChecklist(
      titulo: 'Navegação previsível e sem loops presos',
      descricao:
          'Rotas nomeadas definidas em um ponto central e retorno claro para a tela inicial.',
      verificado: true,
    ),
    _ItemChecklist(
      titulo: 'Separação de responsabilidades por tela',
      descricao:
          'Cada módulo fica em seu arquivo dentro de lib/screens/, facilitando leitura e manutenção.',
      verificado: true,
    ),
    _ItemChecklist(
      titulo: 'Resiliência sem backend ou banco externo',
      descricao:
          'Conteúdo e estado local funcionam offline/sem rede externa, evitando falhas de conexão na demo.',
      verificado: true,
    ),
    _ItemChecklist(
      titulo: 'Teste manual de fluxo e estados visuais',
      descricao:
          'Filtros, etapas, barra de progresso e verificação interativa testados ponta a ponta.',
      verificado: false,
    ),
  ];

  static final List<_CriterioQualidade> _criterios = [
    _CriterioQualidade(
      pilares: 'Usabilidade & Clareza',
      resumo:
          'Textos diretos, feedback visual imediato e controles fáceis de identificar sem exigir manual.',
      aplicacaoNoApp:
          'Chips de filtro, barra de progresso e destaque na opção selecionada evitam dúvida sobre onde o usuário está.',
    ),
    _CriterioQualidade(
      pilares: 'Manutenibilidade & Modularidade',
      resumo:
          'Código organizado em widgets e arquivos coesos torna alterações simples sem quebrar outras partes.',
      aplicacaoNoApp:
          'Rotas centralizadas em main.dart e telas isoladas em lib/screens/ reduzem acoplamento.',
    ),
    _CriterioQualidade(
      pilares: 'Confiabilidade & Verificação',
      resumo:
          'Validação de fluxos e prevenção de erros de compilação ou estados inconsistentes antes da entrega.',
      aplicacaoNoApp:
          'Uso de flutter analyze, testes manuais das transições e checklist de prontidão para apresentação.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final concluidos =
        _itensVerificacao.where((item) => item.verificado).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qualidade de Software no App'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Critérios aplicados ao projeto',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...List.generate(_criterios.length, (index) {
              final criterio = _criterios[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          criterio.pilares,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(criterio.resumo),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'No projeto: ${criterio.aplicacaoNoApp}',
                            style: const TextStyle(fontSize: 13.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Checklist de qualidade ($concluidos/${_itensVerificacao.length})',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Marque o que já foi conferido antes da entrega em 05/12/2026:',
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(_itensVerificacao.length, (i) {
                      final item = _itensVerificacao[i];
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: item.verificado,
                        title: Text(
                          item.titulo,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(item.descricao),
                        onChanged: (valor) {
                          setState(() {
                            item.verificado = valor ?? false;
                          });
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CriterioQualidade {
  final String pilares;
  final String resumo;
  final String aplicacaoNoApp;

  const _CriterioQualidade({
    required this.pilares,
    required this.resumo,
    required this.aplicacaoNoApp,
  });
}

class _ItemChecklist {
  final String titulo;
  final String descricao;
  bool verificado;

  _ItemChecklist({
    required this.titulo,
    required this.descricao,
    required this.verificado,
  });
}