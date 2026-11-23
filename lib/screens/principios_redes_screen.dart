import 'package:flutter/material.dart';

class PrincipiosRedesScreen extends StatefulWidget {
  const PrincipiosRedesScreen({super.key});

  @override
  State<PrincipiosRedesScreen> createState() => _PrincipiosRedesScreenState();
}

class _PrincipiosRedesScreenState extends State<PrincipiosRedesScreen> {
  String _filtroSelecionado = 'Todos';

  static const List<String> _filtros = [
    'Todos',
    'Fundamentos',
    'Endereçamento',
    'Cloud',
  ];

  static const List<_TopicoRede> _topicos = [
    _TopicoRede(
      categoria: 'Fundamentos',
      titulo: 'Nós, Enlaces e Topologias',
      resumo:
          'Hosts, switches, roteadores e pontos de acesso interligados por cabo, fibra óptica ou Wi-Fi formam a infraestrutura de comunicação.',
      exemplo:
          'Em uma rede local (LAN), um switch encaminha quadros entre máquinas próximas, enquanto o roteador liga essa rede a outras redes.',
    ),
    _TopicoRede(
      categoria: 'Fundamentos',
      titulo: 'Camadas, Protocolos e Portas',
      resumo:
          'Dividir a comunicação em camadas (como TCP/IP e OSI) padroniza formatos e responsabilidades; portas identificam qual serviço recebe os dados.',
      exemplo:
          'O navegador usa HTTP/HTTPS (comumente portas 80/443) sobre TCP para pedir uma página e garantir entrega ordenada.',
    ),
    _TopicoRede(
      categoria: 'Endereçamento',
      titulo: 'Endereços MAC, IP e DNS',
      resumo:
          'MAC identifica a interface na rede local, IP identifica a rede e o host no roteamento, e o DNS traduz nomes legíveis em endereços IP.',
      exemplo:
          'Ao digitar um domínio, o DNS consulta o IP correspondente para que os pacotes alcancem o servidor correto.',
    ),
    _TopicoRede(
      categoria: 'Endereçamento',
      titulo: 'Máscara de Rede, Sub-redes e Gateway',
      resumo:
          'A máscara separa a porção de rede da porção de host; quando o destino está fora da sub-rede, o tráfego vai para o gateway padrão.',
      exemplo:
          'Um dispositivo em 192.168.1.10/24 envia pacotes para a internet por meio do gateway local, como 192.168.1.1.',
    ),
    _TopicoRede(
      categoria: 'Cloud',
      titulo: 'Redes Virtuais (VPC) e Sub-redes na Nuvem',
      resumo:
          'Na computação em nuvem, redes isoladas logicamente permitem separar camadas públicas e privadas, controlar rotas e aplicar regras de firewall.',
      exemplo:
          'Uma API e um banco de dados podem ficar em sub-redes distintas dentro de uma rede virtual, com acesso restrito entre eles.',
    ),
    _TopicoRede(
      categoria: 'Cloud',
      titulo: 'Latência, Largura de Banda e Disponibilidade',
      resumo:
          'A qualidade da rede impacta diretamente sistemas distribuídos e serviços em nuvem: latência é o atraso e largura de banda é a capacidade.',
      exemplo:
          'Distribuir réplicas ou usar cache próximo ao usuário reduz latência e evita gargalos em picos de acesso.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final topicosFiltrados = _filtroSelecionado == 'Todos'
        ? _topicos
        : _topicos.where((t) => t.categoria == _filtroSelecionado).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Princípios Básicos de Redes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: _filtros.map((filtro) {
                final selecionado = _filtroSelecionado == filtro;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(filtro),
                    selected: selecionado,
                    onSelected: (_) {
                      setState(() => _filtroSelecionado = filtro);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: topicosFiltrados.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = topicosFiltrados[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chip(
                          label: Text(item.categoria),
                          visualDensity: VisualDensity.compact,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.titulo,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(item.resumo),
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
                            'Exemplo prático: ${item.exemplo}',
                            style: const TextStyle(fontSize: 13.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicoRede {
  final String categoria;
  final String titulo;
  final String resumo;
  final String exemplo;

  const _TopicoRede({
    required this.categoria,
    required this.titulo,
    required this.resumo,
    required this.exemplo,
  });
}