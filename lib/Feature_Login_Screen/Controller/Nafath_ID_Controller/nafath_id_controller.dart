import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NafathIdController {
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();

  /// Validates Saudi National / Iqama number (very basic rule: 10 digits)
  String? validateId(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return "الرجاء إدخال رقم الهوية أو الإقامة";
    if (v.length != 10) return "يجب أن يكون الرقم مكوَّنًا من 10 أرقام";
    if (!RegExp(r'^[0-9]+$').hasMatch(v)) return "يجب أن يحتوي فقط على أرقام";
    return null;
  }

  /// Open Nafath in the proper store (Android / iOS)
  Future<void> launchNafathStore() async {
    final url = Platform.isAndroid
        ? Uri.parse('https://play.google.com/store/apps/details?id=sa.gov.nic.myid')
        : Uri.parse('https://apps.apple.com/sa/app/nafath/id1598909871');

    final ok = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!ok) {
      throw Exception('Could not launch $url');
    }
  }

  void dispose() => idController.dispose();
}
