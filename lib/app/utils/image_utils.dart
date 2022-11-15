import 'package:flutter/services.dart';

class ImageUtils {
  static Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  static String convertUint8ListToString(Uint8List uint8list) {
    return String.fromCharCodes(uint8list);
  }
}
