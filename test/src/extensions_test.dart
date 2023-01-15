import 'package:qr_stringify/src/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringBufferX', () {
    test('Should return List<String> of length 2 when word has no break-line',
        () {
      final buffer = StringBuffer()
        ..writeln('Hello')
        ..write('World');

      final lines = buffer.splitToLines();
      expect(lines.length, equals(2));
      expect(lines, equals(['Hello', 'World']));
    });

    test(
        'Should return List<String> of length 3 when word ends with break-line',
        () {
      final buffer = StringBuffer()
        ..writeln('Hello')
        ..writeln('World');

      final lines = buffer.splitToLines();
      expect(lines.length, equals(3));
      expect(lines, equals(['Hello', 'World', '']));
    });
  });

  group('IntX', () {
    test('Should return empty String when int is zero', () {
      expect(0.space.length, equals(0));
      expect(0.space, equals(''));
    });

    test('Should return correctly spaced String when int is positive', () {
      expect(2.space, equals('  '));
    });

    test('Should throw ArgumentError when int is negative', () {
      expect(() => (-2).space, throwsArgumentError);
    });
  });
}
