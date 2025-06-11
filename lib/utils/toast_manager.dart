import 'package:flutter/material.dart';

import '../view/widgets/toast_widget.dart';

class ToastManager {
  static final ToastManager _instance = ToastManager._internal();
  factory ToastManager() => _instance;
  ToastManager._internal();

  OverlayState? _overlayState;
  final List<OverlayEntry> _entries = [];

  void showToast({
    required BuildContext context,
    required String message,
    IconData? icon,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    ToastPosition position = ToastPosition.bottom,
  }) {
    _overlayState ??= Overlay.of(context);

    final entry = OverlayEntry(
      builder: (context) {
        return ToastWidget(
          message: message,
          icon: icon,
          textColor: textColor,
          position: position,
        );
      },
    );

    _entries.add(entry);
    _overlayState!.insert(entry);

    Future.delayed(duration, () {
      entry.remove();
      _entries.remove(entry);
    });
  }
}

enum ToastPosition { top, bottom, center }
