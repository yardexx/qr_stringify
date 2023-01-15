import 'package:qr_stringify/qr_stringify.dart';
import 'package:qr_stringify/src/qr_drawer_factory.dart';

/// A builder class which creates QR drawer and draws code accordingly.
///
/// Takes [data] represented as [String] which will be encoded in QR code.
///
/// You can set type of charset which will be used to draw QR code by setting
/// [encoding] parameter.
///
/// Takes [padding] which represent how much "space" will be left around QR code
/// (in QR terminology, this is called "quiet zone"). "Space" is horizontally
/// represented as two spaces ("  ") and vertically as one break line ("\n").
///
/// You can have multiple instances of [QrBuilder] and/or reuse single instance.
class QrBuilder {
  /// Creates an instance builder.
  QrBuilder({
    required this.data,
    this.encoding = Encoding.utf8,
  });

  /// Type of charset.
  Encoding encoding;

  /// Value of padding (quiet zone) around code.
  int padding = 0;

  /// Correction level of code.
  ErrorCorrectionLevel correctionLevel = ErrorCorrectionLevel.L;

  /// Data to represent as QR code.
  String data;

  /// Builds QR code with cached values and options.
  ///
  /// Returns [String] which represents drawn code.
  String build() {
    final drawer = QrDrawerFactory.encoding(encoding)
      ..addCode(QrCode.fromBuilder(this))
      ..addPadding(padding);
    return drawer.draw();
  }
}
