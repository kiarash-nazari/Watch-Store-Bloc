import 'package:flutter/material.dart';

extension SizedBoxExtention on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}

extension PriceFormat on num {
  String formatPrice() {
    List<String> parts = toString().split('.');

    // Format the whole part
    String wholePart = parts[0];
    String formattedWholePart = '';

    for (int i = wholePart.length - 1; i >= 0; i--) {
      formattedWholePart = wholePart[i] + formattedWholePart;

      if ((wholePart.length - i) % 3 == 0 && i != 0) {
        formattedWholePart = ',$formattedWholePart';
      }
    }

    // Combine the whole part and decimal part (if exists)
    String formattedPrice = formattedWholePart;
    if (parts.length > 1) {
      formattedPrice += '.${parts[1]}';
    }

    return formattedPrice;
  }
}
