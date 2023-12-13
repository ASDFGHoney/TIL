import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Notifier<int> {
  @override
  int build() {
    ref.onDispose(() {
      print('[CounterProvider] disposed');
    });
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<Counter, int>(Counter.new);
