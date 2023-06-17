import 'dart:io' show Platform;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

import '../../main.dart';

class ArsLoadingDialog {
  late ArsProgressDialog progressDialog;

  ArsLoadingDialog() {
    progressDialog = ArsProgressDialog(
      dismissAble: true,
      blur: 8,
    );
  }

  void show() => progressDialog.show();
}

class ArsProgressDialog {
  final Widget? loadingWidget;
  final VoidCallback? onCancel;
  final bool? dismissAble;
  final VoidCallback? onDismiss;
  final double blur;
  final Color? backgroundColor;
  final bool useSafeArea;

  bool _isShowing = false;
  _ArsProgressDialogWidget? _progressDialogWidget;

  bool get isShowing => _isShowing;

  ArsProgressDialog({
    this.backgroundColor,
    this.blur = 0,
    this.onCancel,
    this.dismissAble,
    this.onDismiss,
    this.loadingWidget,
    this.useSafeArea = false,
  }) {
    _initProgress();
  }

  void _initProgress() {
    _progressDialogWidget = _ArsProgressDialogWidget(
      blur: blur,
      onCancel: onCancel,
      dismissAble: dismissAble,
      backgroundColor: backgroundColor,
      onDismiss: onDismiss,
      loadingWidget: loadingWidget,
    );
  }

  // Show progress dialog
  void show() async {
    if (!_isShowing) {
      _isShowing = true;
      if (_progressDialogWidget == null) _initProgress();
      await showDialog(
        useSafeArea: useSafeArea,
        context: navigatorKey.currentState!.context,
        barrierDismissible: dismissAble ?? true,
        builder: (context) => _progressDialogWidget!,
        barrierColor: Colors.transparent,
      );
      _isShowing = false;
    }
  }
}

class _ArsProgressDialogWidget extends StatelessWidget {
  final Widget? loadingWidget;
  final VoidCallback? onCancel;
  final VoidCallback? onDismiss;
  final double? blur;
  final Color? backgroundColor;
  final bool? dismissAble;

  const _ArsProgressDialogWidget({
    this.loadingWidget,
    this.onCancel,
    this.dismissAble,
    this.onDismiss,
    this.backgroundColor,
    this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return _DialogBackground(
      blur: blur,
      dismissAble: dismissAble ?? true,
      onDismiss: onDismiss,
      color: backgroundColor,
      dialog: Center(
        child: loadingWidget ??
            Center(
              child: Platform.isAndroid
                  ? CircularProgressIndicator(
                      strokeWidth: 5,
                      color: AppColors.primaryColor,
                    )
                  : CupertinoActivityIndicator(
                      radius: 20,
                      color: AppColors.primaryColor,
                    ),
            ),
      ),
    );
  }
}

class _DialogBackground extends StatelessWidget {
  // Widget of dialog, you can use NDialog, Dialog, AlertDialog or Custom your own Dialog
  final Widget? dialog;

  // Because blur dialog cover the barrier, you have to declare here
  final bool? dismissAble;

  // Action before dialog dismissed
  final VoidCallback? onDismiss;

  // Creates an background filter that applies a Gaussian blur.
  // Default = 0
  final double? blur;

  // Background color
  final Color? color;

  const _DialogBackground({
    this.dialog,
    this.dismissAble,
    this.blur,
    this.onDismiss,
    this.color = const Color(0x99000000),
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (dismissAble ?? true) {
          if (onDismiss != null) onDismiss!();
          Navigator.pop(context);
        }
        return false;
      },
      child: Stack(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: dismissAble ?? true
                ? () {
                    if (onDismiss != null) {
                      onDismiss!();
                    }
                    Navigator.pop(context);
                  }
                : () {},
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur!,
                sigmaY: blur!,
              ),
              child: dialog,
            ),
          ),
        ],
      ),
    );
  }
}
