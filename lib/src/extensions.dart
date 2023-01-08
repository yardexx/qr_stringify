extension StringBufferX on StringBuffer {
  List<String> splitToLines() {
    return toString().split('\n');
  }
}

extension IntX on int {
  String get space => '  ' * this;
}
