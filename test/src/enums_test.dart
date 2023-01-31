import 'package:qr_stringify/qr_stringify.dart';
import 'package:test/test.dart';

void main() {
  group('ErrorLevelCorrection', () {
    test('Should return correct level of enum', () {
      expect(ErrorCorrectionLevel.L.level, equals(1));
      expect(ErrorCorrectionLevel.M.level, equals(0));
      expect(ErrorCorrectionLevel.Q.level, equals(3));
      expect(ErrorCorrectionLevel.H.level, equals(2));
    });
  });
}
