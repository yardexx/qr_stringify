import 'package:qr_stringify/src/enums.dart';

abstract class Drawer {
  void addImage(String image);
  
  void addPadding(int padding);
  
  void addBorder(Border border);

  String draw();
}
