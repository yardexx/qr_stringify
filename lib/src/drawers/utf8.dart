import 'package:qr_stringify/src/models/qr_code.dart';
import 'package:qr_stringify/src/qr_drawer_base.dart';

class Utf8 extends QrDrawerBase {
  static const _upperHalfBlock = '▀';
  static const _bottomHalfBlock = '▄';
  static const _fullBlock = '█';
  static const _space = ' ';
  static const _newline = '\n';

  @override
  String drawCode(QrCode code) {
    final qrImage = code.toMatrix();
    final buffer = StringBuffer();
    for (var x = 0; x < qrImage.length; x = x + 2) {
      for (var y = 0; y < qrImage.length; y++) {
        if (qrImage[x][y] == 1) {
          if (x + 1 != qrImage.length && qrImage[x + 1][y] == 1) {
            buffer.write(_fullBlock);
          } else {
            buffer.write(_upperHalfBlock);
          }
        } else {
          if (x + 1 != qrImage.length && qrImage[x + 1][y] == 1) {
            buffer.write(_bottomHalfBlock);
          } else {
            buffer.write(_space);
          }
        }
      }
      buffer.write(_newline);
    }
    return buffer.toString();
  }
}
