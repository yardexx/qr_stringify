import 'package:qr_stringify/src/drawers/drawers.dart';
import 'package:qr_stringify/src/enums.dart';

class QrDrawerFactory {
  static QrDrawerBase encoding(Encoding type) {
    switch (type) {
      case Encoding.utf8:
        return Utf8();
    }
  }
}
