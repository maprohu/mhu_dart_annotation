// sealed class TypeArg {
//   final bool nullable;
//
//   const factory TypeArg.param(String name) = TypeParam;
//
//   const factory TypeArg.type({
//     List<TypeArg> typeArgs,
//     bool nullable,
//   }) = TypeWithArgs;
//
//   const TypeArg._({
//     this.nullable = false,
//   });
// }
//
// class TypeParam extends TypeArg {
//   final String name;
//
//   const TypeParam(
//     this.name, {
//     super.nullable,
//   }) : super._();
// }
//
// class TypeWithArgs<T> extends TypeArg {
//   final List<TypeArg> typeArgs;
//
//   const TypeWithArgs({
//     this.typeArgs = const [],
//     super.nullable,
//   }) : super._();
// }
//
// const outputParam = TypeParam("O");
//
// class Customizer {
//   final String name;
//   final List<TypeParam> typeParams;
//   final TypeWithArgs key;
//   final TypeWithArgs input;
//   final List<TypeParam> outputParams;
//   final TypeArg output;
//
//   const Customizer({
//     required this.name,
//     this.typeParams = const [],
//     this.outputParams = const [outputParam],
//     required this.key,
//     required this.input,
//     this.output = outputParam,
//   });
// }
//
// class Customizers {
//   final List<Customizer> customizers;
//
//   const Customizers(this.customizers);
// }

class GenericFeature<K, I, O> {
  final O Function(
    K key,
    I input,
  ) _default;

  final _map = <K, O Function(I mapEntry)>{};

  GenericFeature(this._default);

  void $put(
    K key,
    O Function(I input) feature,
  ) {
    _map[key] = feature;
  }

  O $invoke(
    K key,
    I input,
  ) {
    final custom = _map[key];

    if (custom == null) {
      return _default(key, input);
    } else {
      return custom(input);
    }
  }
}

class Customizer {
  final int keyParamCount;

  const Customizer({
    this.keyParamCount = 1,
  });
}

// class Lookup {
//   const Lookup();
// }
