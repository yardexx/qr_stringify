import 'dart:typed_data';

import 'package:qr/qr.dart';
import 'package:qr_cli_drawer/src/qr_drawer.dart';

class AsciiDrawer extends QrDrawer {
  static const _character = '#';
  static const _space = ' ';
  static const _newline = '\n';

  @override
  String draw(QrCode qrCode) {
    final qrImage = QrImage(qrCode);
    final buffer = StringBuffer();

    buffer.write('#' * qrImage.moduleCount);
    buffer.write(_newline);
    buffer.write('#' * qrImage.moduleCount);
    buffer.write(_newline);

    for (var x = 0; x < qrImage.moduleCount; x = x + 2) {
      for (var y = 0; y < qrImage.moduleCount; y++) {
        _writeCharacter(buffer, qrImage.isDark(x, y));
      }
      buffer.write(_newline);
    }
    buffer.write('#' * qrImage.moduleCount);
    buffer.write(_newline);
    buffer.write('#' * qrImage.moduleCount);
    buffer.write(_newline);

    return buffer.toString();
  }

  void _writeCharacter(StringBuffer buffer, bool isDark) {
    buffer.write(isDark ? _space : _character);
  }
}
