import 'dart:io';
import '../domain/models/enums/service_type.dart';

void main() {
  print('🛠️  Gerando firebase-messaging-sw.js...');

  final envFile = File('.env');
  if (!envFile.existsSync()) {
    print('🚨 Erro: Arquivo .env não encontrado!');
    exit(1);
  }

  final envVars = <String, String>{};
  envFile.readAsLinesSync().forEach((line) {
    if (line.trim().isEmpty || line.startsWith('#')) return;
    final parts = line.split('=');
    if (parts.length >= 2) {
      final key = parts[0].trim();
      final value = parts.skip(1).join('=').trim();
      envVars[key] = value;
    }
  });

  final Map<NotificationTarget, String> targetRoutes = {
    NotificationTarget.suspect: '/#/fugitives?cpf=',
    NotificationTarget.incident: '/#/incidents?id=',
    NotificationTarget.alert: '/#/alerts?id=',
  };

  final routingBuffer = StringBuffer();

  targetRoutes.forEach((target, routePrefix) {
    final targetString = target.name.toUpperCase();

    routingBuffer.writeln("""
        else if (data.target === '$targetString' && data.id) {
            urlToOpen += '$routePrefix' + data.id;
        }""");
  });

  final templateFile = File('web/firebase-messaging-sw.js.template');
  if (!templateFile.existsSync()) {
    print('🚨 Erro: Arquivo web/firebase-messaging-sw.js.template não encontrado!');
    exit(1);
  }

  String content = templateFile.readAsStringSync();

  envVars.forEach((key, value) {
    content = content.replaceAll('{{$key}}', value);
  });

  content = content.replaceAll('{{ROUTING_LOGIC}}', routingBuffer.toString());

  final outputFile = File('web/firebase-messaging-sw.js');
  outputFile.writeAsStringSync(content);

  print('✅ firebase-messaging-sw.js gerado com sucesso com ${targetRoutes.length} rotas dinâmicas!');
}