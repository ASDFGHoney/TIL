import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_provider.g.dart';

// final autoDisposeHelloProvider = Provider.autoDispose<String>((ref) {
//   print('[autoDisposeHelloProvider] create');
//   ref.onDispose(() {
//     print('[autoDisposeHelloProvider] onDispose()');
//   });
//   return 'Hello';
// });

@riverpod
String autoDisposeHello(AutoDisposeHelloRef ref) {
  print('[autoDisposeHelloProvider] create');
  ref.onDispose(() {
    print('[autoDisposeHelloProvider] onDispose()');
  });
  return 'Hello';
}
