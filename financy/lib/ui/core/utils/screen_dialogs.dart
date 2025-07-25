import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showQuickErrorAlert({
  required BuildContext context,
  String title = 'Oops...',
  String text = 'Algo deu errado.',
  String confirmBtnText = 'OK',
  VoidCallback? onConfirmBtnTap,
}) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: title,
    text: text,
    confirmBtnText: confirmBtnText,
    onConfirmBtnTap: onConfirmBtnTap,
    confirmBtnColor: AppColors.green,
  );
}
