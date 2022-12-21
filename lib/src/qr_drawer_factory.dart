import 'package:qr_cli_drawer/src/ascii_drawer.dart';
import 'package:qr_cli_drawer/src/enums.dart';
import 'package:qr_cli_drawer/src/qr_drawer.dart';
import 'package:qr_cli_drawer/src/utf_drawer.dart';

class QrDrawerFactory {
  static QrDrawer byType(DrawingType type) {
    switch (type) {
      case DrawingType.ascii:
        return AsciiDrawer();
      case DrawingType.utf:
        return UtfDrawer();
    }
  }
}
