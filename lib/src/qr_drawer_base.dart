import 'package:qr_stringify/src/drawer.dart';
import 'package:qr_stringify/src/enums.dart';
import 'package:qr_stringify/src/extensions.dart';
import 'package:qr_stringify/src/models/qr_code.dart';

abstract class QrDrawerBase extends Drawer {
  final _codeBuffer = StringBuffer();

  String drawCode(QrCode code);

  void addCode(QrCode code) {
    addImage(drawCode(code));
  }

  @override
  void addImage(String image) {
    _codeBuffer.write(image);
  }

  @override
  void addBorder(Border border) {
    throw UnimplementedError('Not implemented yet.');
  }

  @override
  void addPadding(int padding) {
    final lines = _codeBuffer.splitToLines()..removeLast();

    _codeBuffer
      ..clear()
      ..write(_computeHorizontalPadding(padding, lines.first.length))
      ..write('\n')
      ..write(_computeVerticalPadding(padding, lines))
      ..write(_computeHorizontalPadding(padding, lines.first.length));
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
