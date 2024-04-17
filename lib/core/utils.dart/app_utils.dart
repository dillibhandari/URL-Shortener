import 'package:flutter/material.dart';
import 'dimens.dart';

class Utils {
  static double getScalingFactor(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width >= 800) {
      return scalingFactor_800sw;
    } else if (width >= 600) {
      return scalingFactor600sw;
    } else if (width < 600 && width > 320) {
      return scalingFactorDefault;
    } else {
      return scalingFactor_320sw;
    }
  }

  static String? validate(String? value, {field}) {
    value ??= "";
    if (value.isEmpty) {
      if (field == "url") {
        return "Please enter valid long url";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
