import 'dart:async';

extension SafeSink<T> on StreamController<T> {
  void sinkAddSafe(T value) {
    if (!this.isClosed) this.sink.add(value);
  }
}

extension IntExtensions on int {
  String toStringWithSign() {
    if (this > 0) return "+$this";
    return "$this";
  }
}
