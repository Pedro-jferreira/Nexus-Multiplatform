import 'dart:io';

void main() {
  print('Gerando firebase-messaging-sw.js.template...');

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

  final templateFile = File('web/firebase-messaging-sw.js.template');
  if (!templateFile.existsSync()) {
    print('🚨 Erro: Arquivo web/firebase-messaging-sw.js.template.template não encontrado!');
    exit(1);
  }

  String templateContent = templateFile.readAsStringSync();

  envVars.forEach((key, value) {
    templateContent = templateContent.replaceAll('{{$key}}', value);
  });

  final outputFile = File('web/firebase-messaging-sw.js');
  outputFile.writeAsStringSync(templateContent);

  print('✅ firebase-messaging-sw.js.template gerado com sucesso!');
}