import 'package:qr_stringify/qr_stringify.dart';
import 'package:test/test.dart';

import '../qr_examples.dart';

void main() {
  test('Should return valid matrix', () {
    const data = 'Hello World';
    final code = QrCode(data, ErrorCorrectionLevel.H);
    expect(code.toMatrix(), equals(helloCodeMatrix));
  });

  test('Should throw ArgumentError when data is empty String', () {
    const data = '';
    expect(() => QrCode(data, ErrorCorrectionLevel.L), throwsArgumentError);

    final builder = QrBuilder(data: data);
    expect(() => QrCode.fromBuilder(builder), throwsArgumentError);
  });

  test('Should return different matrix for different code', () {
    const data = 'Hello';
    final code = QrCode(data, ErrorCorrectionLevel.H);
    expect(code.toMatrix(), isNot(equals(helloCodeMatrix)));
  });
}
