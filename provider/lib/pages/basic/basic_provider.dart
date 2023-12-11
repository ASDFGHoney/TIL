import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

// final helloProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[helloProvider] onDispose()');
//   }); // Called when the provider is destroyed,
//   return 'Hello';
// });

// final worldProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] onDispose()');
//   }); // Called when the provider is destroyed,
//   return 'World';
// });

@Riverpod(keepAlive: true)
String hello(HelloRef ref) {
  ref.onDispose(() {
    print('[worldProvider] onDispose()');
  }); // Called when the provider is destroyed,
  return 'World';
}

@Riverpod(keepAlive: true)
String world(WorldRef ref) {
  ref.onDispose(() {
    print('[worldProvider] onDispose()');
  }); // Called when the provider is destroyed,
  return 'world';
}
