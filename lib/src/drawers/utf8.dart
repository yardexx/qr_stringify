import 'package:qr_stringify/qr_stringify.dart';

/// A class which implements [QrDrawerBase].
///
/// Draws QR code using UTF-8 characters.
///
/// Checks for each *two* lines at once and figures out correct char.
class Utf8 extends QrDrawerBase {
  static const _upperHalfBlock = '▀';
  static const _bottomHalfBlock = '▄';
  static const _fullBlock = '█';
  static const _space = ' ';

  @override
  String drawCode(QrCode code) {
    final rawImage = code.toMatrix();
    final buffer = StringBuffer();

    for (var x = 0; x < rawImage.length; x = x + 2) {
      buffer.writeln(_generateRow(rawImage, x).join());
    }

    return buffer.toString();
  }

  List<String> _generateRow(Matrix<int> rawData, int row) {
    return List.generate(
      rawData.length,
      (column) => _findChar(rawData, row, column),
    ).toList();
  }

  String _findChar(Matrix<int> rawData, int row, int column) {
    return (rawData[row][column] == 1)
        ? _checkFullBlock(rawData, row, column)
        : _checkEmptyBlock(rawData, row, column);
  }

  String _checkEmptyBlock(Matrix<int> rawData, int row, int column) {
    return (row + 1 != rawData.length && rawData[row + 1][column] == 1)
        ? _bottomHalfBlock
        : _space;
  }

  String _checkFullBlock(Matrix<int> rawImage, int row, int column) {
    return (row + 1 != rawImage.length && rawImage[row + 1][column] == 1)
        ? _fullBlock
        : _upperHalfBlock;
  }
}
