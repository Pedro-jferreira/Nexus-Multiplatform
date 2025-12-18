import 'package:Nexus/routing/routes/web/app_router_web.dart';
import 'package:flutter/material.dart';

import '../domain/models/enums/service_type.dart';


class NotificationDispatcher {

  static NotificationTarget _parseTarget(String? target) {
    switch (target?.toUpperCase()) {
      case 'SUSPECT':
        return NotificationTarget.suspect;
      case 'INCIDENT':
        return NotificationTarget.incident;
      default:
        return NotificationTarget.unknown;
    }
  }

  static void dispatch(BuildContext context, Map<String, dynamic> data) {
    final targetString = data['target'] as String?;
    final id = data['id'] as String?;

    final target = _parseTarget(targetString);

    debugPrint('🔔 Dispatching notificação: $target com ID: $id');

    switch (target) {
      case NotificationTarget.suspect:
        if (id != null) {
          FugitivesRoute(cpf: id).go(context);
        } else {
          const FugitivesRoute().go(context);
        }
        break;

      case NotificationTarget.incident:

       IncidentsRoute().go(context);
        break;

      case NotificationTarget.unknown:
      default:
        debugPrint('⚠️ Tipo de notificação desconhecido ou sem rota: $targetString');
        break;
    }
  }
}