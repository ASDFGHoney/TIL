// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose_family_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoDisposeFamilyHelloHash() =>
    r'7990687dbc05f963d8e625283e2fb23806558ba1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [autoDisposeFamilyHello].
@ProviderFor(autoDisposeFamilyHello)
const autoDisposeFamilyHelloProvider = AutoDisposeFamilyHelloFamily();

/// See also [autoDisposeFamilyHello].
class AutoDisposeFamilyHelloFamily extends Family<String> {
  /// See also [autoDisposeFamilyHello].
  const AutoDisposeFamilyHelloFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'autoDisposeFamilyHelloProvider';

  /// See also [autoDisposeFamilyHello].
  AutoDisposeFamilyHelloProvider call({
    required String there,
  }) {
    return AutoDisposeFamilyHelloProvider(
      there: there,
    );
  }

  @visibleForOverriding
  @override
  AutoDisposeFamilyHelloProvider getProviderOverride(
    covariant AutoDisposeFamilyHelloProvider provider,
  ) {
    return call(
      there: provider.there,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(String Function(AutoDisposeFamilyHelloRef ref) create) {
    return _$AutoDisposeFamilyHelloFamilyOverride(this, create);
  }
}

class _$AutoDisposeFamilyHelloFamilyOverride implements FamilyOverride<String> {
  _$AutoDisposeFamilyHelloFamilyOverride(this.overriddenFamily, this.create);

  final String Function(AutoDisposeFamilyHelloRef ref) create;

  @override
  final AutoDisposeFamilyHelloFamily overriddenFamily;

  @override
  AutoDisposeFamilyHelloProvider getProviderOverride(
    covariant AutoDisposeFamilyHelloProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [autoDisposeFamilyHello].
class AutoDisposeFamilyHelloProvider extends AutoDisposeProvider<String> {
  /// See also [autoDisposeFamilyHello].
  AutoDisposeFamilyHelloProvider({
    required String there,
  }) : this._internal(
          (ref) => autoDisposeFamilyHello(
            ref as AutoDisposeFamilyHelloRef,
            there: there,
          ),
          from: autoDisposeFamilyHelloProvider,
          name: r'autoDisposeFamilyHelloProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoDisposeFamilyHelloHash,
          dependencies: AutoDisposeFamilyHelloFamily._dependencies,
          allTransitiveDependencies:
              AutoDisposeFamilyHelloFamily._allTransitiveDependencies,
          there: there,
        );

  AutoDisposeFamilyHelloProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.there,
  }) : super.internal();

  final String there;

  @override
  Override overrideWith(
    String Function(AutoDisposeFamilyHelloRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutoDisposeFamilyHelloProvider._internal(
        (ref) => create(ref as AutoDisposeFamilyHelloRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        there: there,
      ),
    );
  }

  @override
  ({
    String there,
  }) get argument {
    return (there: there,);
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _AutoDisposeFamilyHelloProviderElement(this);
  }

  AutoDisposeFamilyHelloProvider _copyWith(
    String Function(AutoDisposeFamilyHelloRef ref) create,
  ) {
    return AutoDisposeFamilyHelloProvider._internal(
      (ref) => create(ref as AutoDisposeFamilyHelloRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      there: there,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AutoDisposeFamilyHelloProvider && other.there == there;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, there.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AutoDisposeFamilyHelloRef on AutoDisposeProviderRef<String> {
  /// The parameter `there` of this provider.
  String get there;
}

class _AutoDisposeFamilyHelloProviderElement
    extends AutoDisposeProviderElement<String> with AutoDisposeFamilyHelloRef {
  _AutoDisposeFamilyHelloProviderElement(super.provider);

  @override
  String get there => (origin as AutoDisposeFamilyHelloProvider).there;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
