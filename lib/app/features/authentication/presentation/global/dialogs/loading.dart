import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common_widgets/loaders/loader_uveg/loading_uveg.dart';

class Loading {
  final BuildContext context;
  Loading(this.context);

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: LoadingUveg(),
          ),
        );
      },
    );
  }

  void hide() {
    context.pop(true);
  }
}
