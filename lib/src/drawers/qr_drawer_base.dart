import 'package:qr_stringify/qr_stringify.dart';
import 'package:qr_stringify/src/drawers/drawing_assembler.dart';
import 'package:qr_stringify/src/extensions.dart';

/// An abstract class which represents drawer for QR codes.
///
/// Uses [StringBuffer] to cache intermediate data of drawn QR code.
abstract class QrDrawerBase implements DrawingAssembler {
  final _codeBuffer = StringBuffer();

  /// Transforms [QrCode] into String image representation.
  ///
  /// It is strongly recommended to use `toMatrix()` function to get raw
  /// representation of QR code when creating drawing logic.
  ///
  /// Returns [String] image of QR code.
  String drawCode(QrCode code);

  /// Adds [QrCode] to [QrDrawerBase].
  ///
  /// Also clears [StringBuffer] cache, effectively discarding every operation
  /// before this one.
  ///
  /// So this code:
  /// ```dart
  /// QrDrawerFactory.encoding(Encoding.utf8)
  ///    ..addCode(const QrCode('Hello', ErrorCorrectionLevel.H))
  ///    ..addPadding(2)
  ///    ..addCode(const QrCode('World', ErrorCorrectionLevel.H));
  /// ```
  /// will result in [QrCode] containing `World` without padding.
  void addCode(QrCode code) {
    _codeBuffer.clear();
    addImage(drawCode(code));
  }

  @override
  void addImage(String image) {
    _codeBuffer.write(image);
  }

  @override
  void addPadding(int padding) {
    if (padding == 0) {
      return;
    }

    final lines = _codeBuffer.splitToLines()..removeLast();

    _codeBuffer
      ..clear()
      ..writeln(_computeHorizontalPadding(padding, lines.first.length))
      ..writeln(_computeVerticalPadding(padding, lines))
      ..writeln(_computeHorizontalPadding(padding, lines.first.length));
  }

  String _createPaddedLine(int padding, String content) {
    return (2 * padding).space + content + (2 * padding).space;
  }

  String _computeVerticalPadding(int padding, List<String> content) {
    return content.map((line) => _createPaddedLine(padding, line)).join('\n');
  }

  String _computeHorizontalPadding(int padding, int lineLength) {
    final paddingLine = (4 * padding + lineLength).space;
    return List.generate(padding, (_) => paddingLine).join('\n');
  }

  @override
  String draw() {
    return _codeBuffer.toString();
  }
}
