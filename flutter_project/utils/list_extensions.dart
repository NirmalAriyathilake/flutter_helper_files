extension ListX on List {
  List<T> distinct<T>() {
    return toSet().toList().map((_) => _ as T).toList();
  }

  bool containsList(List other) {
    return join().contains(other.join());
  }

  bool startsWith(List other) {
    return join().startsWith(other.join());
  }

  bool endsWith(List other) {
    return join().endsWith(other.join());
  }
}

extension IterableX on Iterable {
  Iterable<T> distinct<T>() {
    return toSet().toList().map((_) => _ as T);
  }

  bool containsList(Iterable other) {
    return join().contains(other.join());
  }

  bool startsWith(Iterable other) {
    return join().startsWith(other.join());
  }

  bool endsWith(Iterable other) {
    return join().endsWith(other.join());
  }
}
