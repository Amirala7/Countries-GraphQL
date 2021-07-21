import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ToastType {
  success,
  error,
}

void toastMessage({
  required String title,
  required String message,
  required ToastType type,
}) {
  Get.snackbar(title, message,
      icon: Icon(type == ToastType.success ? Icons.check_circle : Icons.close),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0));
}
