enum Encoding {
  utf8;
}

enum ErrorCorrectionLevel {
  L(1),
  M(0),
  Q(3),
  H(2);

  final int level;

  const ErrorCorrectionLevel(this.level);
}

enum Border {
  none,
  single,
  double;
}
