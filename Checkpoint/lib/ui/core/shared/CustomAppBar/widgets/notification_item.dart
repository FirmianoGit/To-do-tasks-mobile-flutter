import 'package:flutter/material.dart';

// Modelo para notificações
class NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    this.icon = Icons.notifications_active,
    this.color = Colors.blue,
    this.onTap,
  });
}