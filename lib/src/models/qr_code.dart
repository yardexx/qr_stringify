import 'package:qr/qr.dart' as qr;
import 'package:qr_stringify/src/enums.dart';
import 'package:qr_stringify/src/qr_builder.dart';

/// Facade class
class QrCode {
  const QrCode(
    this._data,
    this._errorCorrectLevel,
  );

  QrCode.fromBuilder(QrBuilder builder)
      : this(builder.data, builder.correctionLevel);

  final ErrorCorrectionLevel _errorCorrectLevel;
  final String _data;

  List<List<int>> toMatrix() {
    final qrCode = qr.QrCode.fromData(
      data: _data,
      errorCorrectLevel: _errorCorrectLevel.level,
    );

    final qrImage = qr.QrImage(qrCode);

    final matrix = <List<int>>[];

    for (var x = 0; x < qrImage.moduleCount; x++) {
      final row = <int>[];
      for (var y = 0; y < qrImage.moduleCount; y++) {
        row.add(qrImage.isDark(x, y) ? 1 : 0);
      }
      matrix.add(row);
    }

    return matrix;
  }
}
