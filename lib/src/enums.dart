/// Indicates which type of charset will be used.
enum Encoding {
  /// UTF-8 charset.
  utf8;
}

/// Indicates level of error corrections -- how much damage to QR code
/// is tolerated.
enum ErrorCorrectionLevel {
  /// Up to 7% damage.
  L(1),

  /// Up to 15% damage.
  M(0),

  /// Up to 25% damage.
  Q(3),

  /// Up to 30% damage.
  H(2);

  /// Creates [ErrorCorrectionLevel] based on int value.
  const ErrorCorrectionLevel(this.level);

  /// Correction level as int. Respects [qr](https://pub.dev/packages/qr)
  /// package values.
  final int level;
}
