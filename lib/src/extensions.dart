/// An extension to simplify work with [StringBuffer].
extension StringBufferX on StringBuffer {
  /// Breaks [String] into List<String>.
  ///
  /// String is split using newline separator.
  /// Returns list of lines.
  List<String> splitToLines() {
    return toString().split('\n');
  }
}

/// An extension to simplify work with [int]
extension IntX on int {
  /// Represents [int] as unit of horizontal space.
  ///
  /// For each unit of [int], one space is added. Used as padding in terminal.
  /// Returns spaced [String] which length is equal to [int].
  String get space => this >= 0
      ? ' ' * this
      : throw ArgumentError.value(
          this,
          'int',
          'Cannot be negative',
        );
}
