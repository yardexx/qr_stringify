import 'package:qr/qr.dart';
import 'package:qr_cli_drawer/src/enums.dart';
import 'package:qr_cli_drawer/src/qr_drawer_factory.dart';

void main() {
  final drawer = QrDrawerFactory.byType(DrawingType.ascii);

  print(
    drawer.draw(
      QrCode.fromData(
        data: 'Hello World',
        errorCorrectLevel: QrErrorCorrectLevel.Q,
      ),
    ),
  );
}
