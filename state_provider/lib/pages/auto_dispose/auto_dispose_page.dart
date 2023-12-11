import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/pages/auto_dispose/auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(autoDisposeAgeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('autoDisposeStateProvider'),
        ),
        body: Center(
          child: Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 아래코드는 쓰기 어렵다 두번 조회하기도 하고;; 대신에 그 아래코드를 사용하자
            // ref.read(autoDisposeCounterProvider.notifier).state =
            //     ref.read(autoDisposeCounterProvider.notifier).state + 10;
            ref
                .read(autoDisposeCounterProvider.notifier)
                .update((state) => state + 10);
          },
          child: const Icon(Icons.add),
        ));
  }
}
