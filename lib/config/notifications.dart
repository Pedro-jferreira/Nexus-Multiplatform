import 'dart:convert';

import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:Nexus/routing/routes/web/app_router_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import '../domain/models/requests/gen_models.dart';
import '../routing/app_router.dart';
import '../routing/notification_dispatcher.dart';
import '../ui/features/suspect/view_models/suspect_view_model.dart';
import '../utils/http_ultils.dart';
import 'firebase_options.dart';
import 'package:universal_html/html.dart' as html;

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
  setupWebNotificationListener();
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
    final Map<String, dynamic> data = Map<String, dynamic>.from(message.data);

    final notification = message.notification;
    final android = notification?.android;

    if (notification != null && kIsWeb) {
      _handleMessageAction(data);
      showSimpleNotification(
        Text(notification.title ?? 'Nova Mensagem'),
        subtitle: Text(notification.body ?? ''),
        background: Colors.blueGrey.shade900, // Um fundo mais elegante
        duration: const Duration(seconds: 6), // Fica 6 segundos na tela (padrão é 2 ou 3)
        slideDismissDirection: DismissDirection.horizontal,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // Botão de Ação na direita
        trailing: Builder(builder: (context) {
          return TextButton(
            onPressed: () {
              // Fecha a notificação visual
              OverlaySupportEntry.of(context)?.dismiss();

              // Navega usando seu Dispatcher
              final navContext = rootNavigatorKey.currentContext;
              if (navContext != null) {
                NotificationDispatcher.dispatch(navContext, data);
              }
            },
            child: const Text(
              'VER',
              style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold),
            ),
          );
        }),
      );
      return;
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
void _handleMessageAction(Map<String, dynamic> data) {
  final context = rootNavigatorKey.currentContext;
  if (context == null) return;
  if (data['action'] == 'refresh_list') {
    try {
      context.read<SuspectViewModel>().fetchCmd.execute();
      debugPrint('🔄 Lista de foragidos atualizada via notificação');
    } catch (e) {
      debugPrint('Erro ao atualizar viewModel: $e');
    }
  }
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

void setupWebNotificationListener() {
  if (kIsWeb) {
    final channel = html.BroadcastChannel('app_channel');
    channel.onMessage.listen((event) {
      print('📻 Dart: Recebido via BroadcastChannel');
      if (event.data == null) return;
      final dynamic data = event.data;
      try {
        Map<String, dynamic> safeData;

        if (data is String) {
          safeData = jsonDecode(data);
        } else {
          safeData = Map<String, dynamic>.from(data as Map);
        }
        if (safeData['type'] == 'NAVIGATE_TO') {
          print('🚀 Payload recebido: ${safeData['payload']}');
          final payload = Map<String, dynamic>.from(safeData['payload']);
          final context = rootNavigatorKey.currentContext;

          if (context != null) {
            NotificationDispatcher.dispatch(context, payload);
          }
        }
      } catch (e) {
        debugPrint('⚠️ Erro no BroadcastChannel: $e');
      }
    });
  }
}
