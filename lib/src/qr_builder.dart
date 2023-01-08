import 'package:qr_stringify/src/enums.dart';
import 'package:qr_stringify/src/models/qr_code.dart';
import 'package:qr_stringify/src/qr_drawer_factory.dart';

class QrBuilder {
  QrBuilder({
    required this.data,
    this.encoding = Encoding.utf8,
  });

  Encoding encoding;
  int padding = 0;
  Border border = Border.none;
  ErrorCorrectionLevel correctionLevel = ErrorCorrectionLevel.H;
  String data;

  String build() {
    final drawer = QrDrawerFactory.encoding(encoding)
      ..addCode(QrCode.fromBuilder(this))
      ..addPadding(padding);
    //..addBorder(border);

    return drawer.draw();
  }
}
