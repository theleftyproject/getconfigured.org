import 'package:flutter/material.dart';

Future<void> scrollToTop(ScrollController controller) async {
  await controller.animateTo(
    0,
    duration: Duration(seconds: 2, milliseconds: 500),
    curve: Curves.easeOut,
  );
}
