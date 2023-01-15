import 'package:qr_stringify/qr_stringify.dart';
import 'package:qr_stringify/src/drawers/drawers.dart';

/// A factory class which creates [QrDrawerBase] representation according to
/// its [Encoding].
class QrDrawerFactory {
  const QrDrawerFactory._();

  /// Static constructor for [QrDrawerBase].
  ///
  /// Returns [QrDrawerBase] instance according to [Encoding].
  static QrDrawerBase encoding(Encoding type) {
    switch (type) {
      case Encoding.utf8:
        return Utf8();
    }
  }
}
