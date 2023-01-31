import 'package:qr_stringify/qr_stringify.dart';
import 'package:qr_stringify/src/drawers/drawers.dart';
import 'package:test/test.dart';

import '../qr_examples.dart';

void main() {
  test('Should return valid QR code when draw() is called', () {
    final code = QrCode('Hello World', ErrorCorrectionLevel.H);
    final drawer = Utf8()..addCode(code);

    expect(drawer.draw(), equals(helloWorldCode));
  });

  test('Should drop all changes when addCode is called multiple times', () {
    final firstCode = QrCode('Hello World', ErrorCorrectionLevel.H);
    final secondCode = QrCode('Hello', ErrorCorrectionLevel.H);
    final drawer = Utf8()
      ..addCode(firstCode)
      ..addPadding(3)
      ..addCode(secondCode);

    expect(drawer.draw(), equals(helloCode));
  });

  test('Should return padded code when addPadding is called', () {
    final code = QrCode('Hello World', ErrorCorrectionLevel.H);
    final drawer = Utf8()
      ..addCode(code)
      ..addPadding(1);

    expect(drawer.draw(), equals(helloWorldCodePadded));
  });

  test(
      'Should return code with stacked padding when addPadding called multiple '
      'times', () {
    final code = QrCode('Hello World', ErrorCorrectionLevel.H);
    final drawer = Utf8()
      ..addCode(code)
      ..addPadding(1)
      ..addPadding(1);
    expect(drawer.draw(), equals(helloWorldCodePaddedTwo));
  });

  test(
      'Should throw ArgumentError when addPadding is called with '
      'negative value', () {
    final code = QrCode('Hello World', ErrorCorrectionLevel.H);
    final drawer = Utf8()..addCode(code);
    expect(() => drawer..addPadding(-1), throwsArgumentError);
  });
}
