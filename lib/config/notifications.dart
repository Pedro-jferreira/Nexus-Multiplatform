import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:overlay_support/overlay_support.dart';
import '../utils/http_ultils.dart';
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

  try {
    await _requestPermission();
  } catch (e, s) {
    if (kDebugMode) {
      print('⚠️ Erro ao pedir permissão: $e');
      print(s);
    }
  }

  if (!kIsWeb) {
    await _createNotificationChannel();
    await _initializeLocalNotifications();
  }

  _setupForegroundListener();
  _setupOpenedAppListener();

  try {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } catch (e) {
    if (kDebugMode) print('⚠️ onBackgroundMessage não disponível no Web');
  }

  try {
    final token = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) print('🔥 FCM Token: $token');
  } catch (e) {
    if (kDebugMode) print('⚠️ Erro ao obter token: $e');
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

void _setupForegroundListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (kDebugMode) {
      print(
        '📩 Mensagem recebida (foreground): ${message.notification?.title}',
      );
    }

    final notification = message.notification;
    final android = notification?.android;

    if (notification != null && kIsWeb) {
      showSimpleNotification(
        Text(notification.title!),
        subtitle: Text(notification.body!),
      );
    }

    if (notification != null && android != null) {
      AndroidBitmap<Object>? largeIconBitmap;
      StyleInformation? bigPictureStyle;
      final String? imageUrl = android.imageUrl;
      if (imageUrl != null) {
        final Uint8List? imageBytes = await getByteArrayFromUrl(imageUrl);

        if (imageBytes != null) {
          largeIconBitmap = ByteArrayAndroidBitmap(imageBytes);

          bigPictureStyle = BigPictureStyleInformation(
            largeIconBitmap,
            hideExpandedLargeIcon: true,
            contentTitle: notification.title,
            summaryText: notification.body,
            htmlFormatContentTitle: true,
            htmlFormatSummaryText: true,
          );
        }
      }

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
            largeIcon: largeIconBitmap,
            styleInformation: bigPictureStyle,
          ),
        ),
        payload: message.data['route'] ?? '',
      );
    }
  });
}

void _setupOpenedAppListener() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('🚀 App aberto pela notificação: ${message.data}');
    // TODO: Navegar conforme o payload se desejar.
  });
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('🕓 Mensagem recebida em background: ${message.messageId}');
}
