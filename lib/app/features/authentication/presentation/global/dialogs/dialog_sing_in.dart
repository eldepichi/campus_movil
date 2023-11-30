import 'package:flutter/material.dart';

import '../../../../../common_widgets/sweetalert/sweetalert.dart';

void showDialogSigIn(
  String title, {
  required BuildContext context,
  String content = '',
}) {
  ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertType.danger,
      title: title,
      text: content,
    ),
  );
}
