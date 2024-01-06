import 'package:flutter/material.dart';

extension SizedBoxExtention on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
