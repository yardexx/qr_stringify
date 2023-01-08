import 'package:qr_stringify/src/drawer.dart';
import 'package:qr_stringify/src/enums.dart';
import 'package:qr_stringify/src/models/qr_code.dart';

import './extensions.dart';

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
    final lines = _codeBuffer.splitToLines();
    final paddingBuffer = StringBuffer();

    // calculate line
    final paddingLine = (4 * padding + lines.first.length).space;

    for (var i = 0; i < padding; i++) {
      paddingBuffer.writeln(paddingLine);
    }

    lines.forEach((element) {
      paddingBuffer.writeln(_createPaddedLine(element, padding));
    });

    for (var i = 0; i < padding; i++) {
      paddingBuffer.writeln(paddingLine);
    }

    _codeBuffer
      ..clear()
      ..write(paddingBuffer.toString());
  }

  String _createPaddedLine(String content, int padding) {
    return (2 * padding).space + content + (2 * padding).space;
  }

  String draw() {
    return _codeBuffer.toString();
  }
}
