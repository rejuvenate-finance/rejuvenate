import 'package:flutter/foundation.dart';

abstract class ReactiveService {
  final List<ValueListenable> _notifiers = [];

  void registerReactiveValues(List<ValueListenable> listenables) {
    _notifiers.clear();
    _notifiers.addAll(listenables);
  }

  void addListener(void Function() onChanged) {
    for (final notifier in _notifiers) {
      notifier.addListener(() {
        onChanged();
      });
    }
  }
}
