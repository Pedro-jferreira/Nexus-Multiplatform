import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel highImportanceChannel =
    AndroidNotificationChannel(
      'high_importance_channel',
      'Notificações importantes',
      description: 'Canal para alertas de segurança prioritários',
      importance: Importance.max,
    );

Future<void> setupNotifications() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await _requestPermission();

  if (!kIsWeb) {
    await _createNotificationChannel();
    await _initializeLocalNotifications();
  }

  _setupForegroundListener();
  _setupOpenedAppListener();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (kIsWeb) {
    await _setupWebNotifications();
  }

  final token = await FirebaseMessaging.instance.getToken();
  if (kDebugMode) {
    print('🔥 FCM Token: $token');
  }
}

Future<void> _requestPermission() async {
  final messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (kDebugMode) {
    print('🔔 Permissão: ${settings.authorizationStatus}');
  }
}

/// Inicializa o plugin de notificações locais (Android/iOS)
Future<void> _initializeLocalNotifications() async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings settings = InitializationSettings(
    android: androidSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    settings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      if (response.payload != null) {
        debugPrint('🔗 Clicou na notificação com payload: ${response.payload}');
      }
    },
  );
}

Future<void> _createNotificationChannel() async {
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(highImportanceChannel);
}

/// Listener para mensagens em foreground
void _setupForegroundListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print(
        '📩 Mensagem recebida (foreground): ${message.notification?.title}',
      );
    }

    if (kIsWeb) {
      // No Web, o navegador exibe automaticamente as notificações
      return;
    }

    final notification = message.notification;
    final android = notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            highImportanceChannel.id,
            highImportanceChannel.name,
            channelDescription: highImportanceChannel.description,
            icon: android.smallIcon,
          ),
        ),
        payload: message.data['route'] ?? '',
      );
    }
  });
}

/// Listener para quando o app é aberto por uma notificação
void _setupOpenedAppListener() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('🚀 App aberto pela notificação: ${message.data}');
    // TODO: Navegar conforme o payload se desejar.
  });
}

/// Handler de mensagens em background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('🕓 Mensagem recebida em background: ${message.messageId}');
}

/// Configuração adicional para Web
Future<void> _setupWebNotifications() async {
  final vapidKey = dotenv.env['VAD_API_KEY_WEB'] ??
      const String.fromEnvironment('VAD_API_KEY_WEB');

  try {
    final token = await FirebaseMessaging.instance.getToken(vapidKey: vapidKey);
    debugPrint('🌐 Token Web FCM: $token');
  } catch (e) {
    debugPrint('❌ Erro ao obter token Web: $e');
  }

  // Foreground Web — o próprio Firebase Web SDK exibe a notificação
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('🌐 Mensagem foreground (Web): ${message.notification?.title}');
    // O navegador já exibe as notificações via service worker.
  });
}
