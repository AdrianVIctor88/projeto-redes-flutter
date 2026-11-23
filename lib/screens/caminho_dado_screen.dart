import 'package:flutter/material.dart';

class CaminhoDadoScreen extends StatefulWidget {
  const CaminhoDadoScreen({super.key});

  @override
  State<CaminhoDadoScreen> createState() => _CaminhoDadoScreenState();
}

class _CaminhoDadoScreenState extends State<CaminhoDadoScreen> {
  int _etapaAtual = 0;
  String? _respostaSelecionada;

  static final List<_EtapaDado> _etapas = [
    _EtapaDado(
      nome: '1. Origem e Encapsulamento',
      camadaFoco: 'Aplicação / Transporte / Rede',
      descricao:
          'A aplicação gera os dados, o transporte define portas e controle (ex.: TCP/UDP) e a camada de rede monta o pacote com IP de origem e destino.',
      detalheTecnico:
          'Na rede local, o pacote é encapsulado em um quadro com endereço MAC de origem e o MAC do próximo salto (geralmente o roteador).',
    ),
    _EtapaDado(
      nome: '2. Meio Físico e Conversão de Sinal',
      camadaFoco: 'Enlace / Físico',
      descricao:
          'Os bits são convertidos em sinais elétricos (cabo par trançado), pulsos de luz (fibra óptica) ou ondas de rádio (Wi-Fi) para atravessar o enlace.',
      detalheTecnico:
          'Atenuação, interferência e largura de banda do meio limitam a taxa de transferência e podem gerar retransmissões.',
    ),
    _EtapaDado(
      nome: '3. Roteador Local, NAT e Gateway',
      camadaFoco: 'Rede (Camada 3)',
      descricao:
          'O roteador lê o endereço IP de destino, verifica que ele está fora da sub-rede local e encaminha o quadro para o gateway padrão.',
      detalheTecnico:
          'Em redes domésticas ou corporativas com IPv4 privado, o roteador costuma aplicar NAT para traduzir o endereço privado ao IP público de saída.',
    ),
    _EtapaDado(
      nome: '4. Provedor (ISP), Backbone e Nuvem',
      camadaFoco: 'Roteamento entre Redes',
      descricao:
          'O pacote passa por roteadores do provedor e do backbone até alcançar a rede do destino (incluindo redes virtuais/VPC na nuvem).',
      detalheTecnico:
          'A cada salto (hop), o IP de origem e destino permanece o mesmo (salvo NAT), mas o cabeçalho de enlace (MAC) é refeito para o próximo enlace.',
    ),
    _EtapaDado(
      nome: '5. Destino Final e Entrega',
      camadaFoco: 'Transporte / Aplicação',
      descricao:
          'O host de destino remove os cabeçalhos de rede e transporte, valida a integridade e entrega os dados à porta/aplicação correta.',
      detalheTecnico:
          'Se houver perda de pacotes em protocolos confiáveis como o TCP, a origem retransmite os trechos faltantes até completar a mensagem.',
    ),
  ];

  static final List<String> _opcoesVerificacao = [
    'O endereço IP de origem/destino muda a cada salto, e o MAC fica fixo.',
    'O MAC muda a cada salto de enlace, enquanto o IP identifica origem e destino fim a fim (salvo NAT).',
    'O roteador atua apenas na camada física sem ler endereços IP.',
  ];

  static const int _indiceCorreto = 1;

  @override
  Widget build(BuildContext context) {
    final etapa = _etapas[_etapaAtual];
    final progresso = (_etapaAtual + 1) / _etapas.length;
    final naUltimaEtapa = _etapaAtual == _etapas.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Caminho do Dado até o Destinatário'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Progresso do percurso: ${_etapaAtual + 1} de ${_etapas.length}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progresso),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(_etapas.length, (index) {
                return ChoiceChip(
                  label: Text('Etapa ${index + 1}'),
                  selected: _etapaAtual == index,
                  onSelected: (_) {
                    setState(() => _etapaAtual = index);
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(etapa.camadaFoco),
                      visualDensity: VisualDensity.compact,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      etapa.nome,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(etapa.descricao),
                    const SizedBox(height: 12),
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
                        'Detalhe do salto: ${etapa.detalheTecnico}',
                        style: const TextStyle(fontSize: 13.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: _etapaAtual > 0
                      ? () => setState(() => _etapaAtual--)
                      : null,
                  child: const Text('Anterior'),
                ),
                FilledButton(
                  onPressed: !naUltimaEtapa
                      ? () => setState(() => _etapaAtual++)
                      : null,
                  child: const Text('Próxima etapa'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Verificação rápida',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Como se comportam MAC e IP durante o trajeto entre redes?',
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(_opcoesVerificacao.length, (i) {
                      final opcao = _opcoesVerificacao[i];
                      final selecionada = _respostaSelecionada == opcao;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(12),
                            backgroundColor: selecionada
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                : null,
                          ),
                          onPressed: () {
                            setState(() => _respostaSelecionada = opcao);
                          },
                          child: Text(opcao),
                        ),
                      );
                    }),
                    if (_respostaSelecionada != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _respostaSelecionada ==
                                _opcoesVerificacao[_indiceCorreto]
                            ? 'Correto: o endereço MAC vale por enlace local e o IP guia o roteamento entre redes.'
                            : 'Revise o conceito: o roteador atua na camada de rede (IP) e troca o quadro/MAC a cada enlace.',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
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

class _EtapaDado {
  final String nome;
  final String camadaFoco;
  final String descricao;
  final String detalheTecnico;

  const _EtapaDado({
    required this.nome,
    required this.camadaFoco,
    required this.descricao,
    required this.detalheTecnico,
  });
}