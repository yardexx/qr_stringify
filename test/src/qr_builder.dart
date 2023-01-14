import 'package:qr_stringify/qr_stringify.dart';
import 'package:test/test.dart';

import 'qr_examples.dart';

void main() {
  const data = 'Hello World';

  final a = QrBuilder(data: data);

  test('', () => expect(a.build(), equals(helloWorldCode)));
}
