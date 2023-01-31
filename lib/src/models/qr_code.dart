import 'package:qr/qr.dart' as qr;
import 'package:qr_stringify/qr_stringify.dart';

/// A facade class which wraps around [qr](https://pub.dev/packages/qr) package.
///
/// [QrCode] represents raw input data which are then transformed into
/// pseudo-image representation.
class QrCode {
  /// Creates an instance of class.
  QrCode(
    this._data,
    this._errorCorrectLevel,
  ) {
    if (_data.isEmpty) {
      throw ArgumentError('Data cannot be empty');
    }
  }

  /// Named constructor which create an instance from [QrBuilder].
  QrCode.fromBuilder(QrBuilder builder)
      : this(builder.data, builder.correctionLevel);

  final ErrorCorrectionLevel _errorCorrectLevel;
  final String _data;

  /// Represents current instance into pseudo-image representation.
  ///
  /// Each cell of [Matrix] represents whether cell is black or white.
  ///
  /// 1 - black
  /// 0 - white
  ///
  /// This is true if, we consider white background. If we have black background
  /// (like terminals use to have), we need negate these rules.
  ///
  /// Returns [Matrix] of integers.
  Matrix<int> toMatrix() {
    final qrCode = qr.QrCode.fromData(
      data: _data,
      errorCorrectLevel: _errorCorrectLevel.level,
    );

    final qrImage = qr.QrImage(qrCode);

    return List.generate(
      qrImage.moduleCount,
      (row) => _generateRow(row, qrImage),
    ).toList();
  }

  List<int> _generateRow(int row, qr.QrImage image) {
    return List.generate(
      image.moduleCount,
      (column) => image.isDark(row, column) ? 1 : 0,
    ).toList();
  }
}
