import 'package:qr_stringify/qr_stringify.dart';
import 'package:test/test.dart';

import 'qr_examples.dart';

void main() {
  const data = 'Hello World';

  test('Should build with default parameters when base constructor called', () {
    final builder = QrBuilder(data: data);

    expect(builder.data, equals(data));
    expect(builder.padding, equals(0));
    expect(builder.correctionLevel, equals(ErrorCorrectionLevel.L));
    expect(builder.encoding, equals(Encoding.utf8));
  });

  test('Should throw ArgumentError when data is empty String', () {
    final builder = QrBuilder(data: '');

    expect(builder.build, throwsArgumentError);
  });

  test('Should return valid QR code when build() called', () {
    final builder = QrBuilder(data: data)
      ..correctionLevel = ErrorCorrectionLevel.H;

    expect(builder.build(), equals(helloWorldCode));
  });

  test('Should return padded code when padding is set', () {
    final builder = QrBuilder(
      data: data,
    )
      ..correctionLevel = ErrorCorrectionLevel.H
      ..padding = 1;

    expect(builder.build(), equals(helloWorldCodePadded));
  });
}
