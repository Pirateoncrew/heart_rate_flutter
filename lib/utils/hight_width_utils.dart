import 'package:flutter/material.dart';

class HightWidthUtils {
  final int offset;
  final BuildContext context;
  HightWidthUtils(this.offset, this.context);
  calCulateWidth() {
    return MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * offset / 100);
  }

  calCulateHeight() {
    return MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.height * offset / 100);
  }
}
