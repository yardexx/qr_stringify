import 'package:qr_stringify/qr_stringify.dart';

/// An abstract interface for class that assembles final image.
///
/// Standard flow:
/// [addImage] gets content which represents image which is drawn. [addPadding]
/// then adds space **around** given image.
///
/// [addPadding] is considered as abstract since implementer of
/// [DrawingAssembler] has to determine how translate int into space padding
/// (e.g. [QrDrawerBase] has different perception of "1 unit of padding" for
/// horizontal and vertical dimension).
abstract class DrawingAssembler {
  /// Adds final image which is drawn.
  ///
  /// Notice that this function shouldn't do drawing itself.
  void addImage(String image);

  /// Adds padding around image.
  void addPadding(int padding);

  /// Assembles and returns final image as [String].
  String draw();
}
