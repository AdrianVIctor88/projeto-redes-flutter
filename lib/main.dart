import 'package:flutter/material.dart';
import 'screens/principios_redes_screen.dart';
import 'screens/caminho_dado_screen.dart';
import 'screens/qualidade_screen.dart';

void main() {
  runApp(const RedesIntegradorApp());
}

class RedesIntegradorApp extends StatelessWidget {
  const RedesIntegradorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redes & Qualidade - Projeto Integrador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/principios': (context) => const PrincipiosRedesScreen(),
        '/caminho-dado': (context) => const CaminhoDadoScreen(),
        '/qualidade': (context) => const QualidadeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Redes, Cloud & Qualidade'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Projeto Integrador - ADS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Aplicação interativa unindo Redes/Cloud e Qualidade de '
                      'Software, sem dependência de backend ou banco de dados.',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Módulos do projeto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: const Icon(Icons.hub, size: 32),
                title: const Text(
                  '1. Princípios Básicos de Redes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Topologias, camadas, IP/MAC/DNS, sub-redes e relação '
                    'com Cloud Computing.',
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/principios'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: const Icon(Icons.alt_route, size: 32),
                title: const Text(
                  '2. Caminho do Dado até o Destinatário',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Encapsulamento, sinal, roteamento/NAT, backbone/nuvem '
                    'e verificação rápida.',
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/caminho-dado'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: const Icon(Icons.verified_user, size: 32),
                title: const Text(
                  '3. Qualidade de Software no App',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Usabilidade, modularização, confiabilidade e checklist '
                    'de verificação.',
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, '/qualidade'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}