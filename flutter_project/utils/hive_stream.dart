import 'dart:async';

import 'package:hive/hive.dart';

mixin HiveStream {
  static StreamController<T> createController<T>({
    required Box box,
    required Function(StreamController controller) onGenerateResults,
    required Function(StreamController controller, Exception exception) onError,
  }) {
    final controller = StreamController<T>();
    var first = false;
    if (!first) {
      try {
        onGenerateResults(controller);
      } on Exception catch (e) {
        onError(controller, e);
      }
    }

    box.watch().forEach(
      (event) {
        try {
          onGenerateResults(controller);
        } on Exception catch (e) {
          onError(controller, e);
        }
      },
    );

    return controller;
  }
}
