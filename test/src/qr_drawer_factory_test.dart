import 'package:qr_stringify/qr_stringify.dart';
import 'package:qr_stringify/src/drawers/drawers.dart';
import 'package:qr_stringify/src/qr_drawer_factory.dart';
import 'package:test/test.dart';

void main() {
  test('Should return utf8 drawer when encoding is utf8', () {
    final drawer = QrDrawerFactory.encoding(Encoding.utf8);

    expect(drawer, isA<Utf8>());
  });
}
