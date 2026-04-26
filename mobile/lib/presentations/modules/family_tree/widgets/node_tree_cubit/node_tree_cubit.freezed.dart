// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_tree_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NodeTreeState {
  PersonNode? get root;
  PersonNode? get maternal;
  PersonNode? get selectedNode;
  int get count;

  /// Create a copy of NodeTreeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NodeTreeStateCopyWith<NodeTreeState> get copyWith =>
      _$NodeTreeStateCopyWithImpl<NodeTreeState>(
          this as NodeTreeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NodeTreeState &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.maternal, maternal) ||
                other.maternal == maternal) &&
            (identical(other.selectedNode, selectedNode) ||
                other.selectedNode == selectedNode) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, root, maternal, selectedNode, count);

  @override
  String toString() {
    return 'NodeTreeState(root: $root, maternal: $maternal, selectedNode: $selectedNode, count: $count)';
  }
}

/// @nodoc
abstract mixin class $NodeTreeStateCopyWith<$Res> {
  factory $NodeTreeStateCopyWith(
          NodeTreeState value, $Res Function(NodeTreeState) _then) =
      _$NodeTreeStateCopyWithImpl;
  @useResult
  $Res call(
      {PersonNode? root,
      PersonNode? maternal,
      PersonNode? selectedNode,
      int count});
}

/// @nodoc
class _$NodeTreeStateCopyWithImpl<$Res>
    implements $NodeTreeStateCopyWith<$Res> {
  _$NodeTreeStateCopyWithImpl(this._self, this._then);

  final NodeTreeState _self;
  final $Res Function(NodeTreeState) _then;

  /// Create a copy of NodeTreeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? root = freezed,
    Object? maternal = freezed,
    Object? selectedNode = freezed,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      root: freezed == root
          ? _self.root
          : root // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
      maternal: freezed == maternal
          ? _self.maternal
          : maternal // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
      selectedNode: freezed == selectedNode
          ? _self.selectedNode
          : selectedNode // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [NodeTreeState].
extension NodeTreeStatePatterns on NodeTreeState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NodeTreeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NodeTreeState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NodeTreeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeTreeState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NodeTreeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeTreeState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(PersonNode? root, PersonNode? maternal,
            PersonNode? selectedNode, int count)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NodeTreeState() when $default != null:
        return $default(
            _that.root, _that.maternal, _that.selectedNode, _that.count);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(PersonNode? root, PersonNode? maternal,
            PersonNode? selectedNode, int count)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeTreeState():
        return $default(
            _that.root, _that.maternal, _that.selectedNode, _that.count);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(PersonNode? root, PersonNode? maternal,
            PersonNode? selectedNode, int count)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeTreeState() when $default != null:
        return $default(
            _that.root, _that.maternal, _that.selectedNode, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NodeTreeState implements NodeTreeState {
  _NodeTreeState({this.root, this.maternal, this.selectedNode, this.count = 0});

  @override
  final PersonNode? root;
  @override
  final PersonNode? maternal;
  @override
  final PersonNode? selectedNode;
  @override
  @JsonKey()
  final int count;

  /// Create a copy of NodeTreeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NodeTreeStateCopyWith<_NodeTreeState> get copyWith =>
      __$NodeTreeStateCopyWithImpl<_NodeTreeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NodeTreeState &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.maternal, maternal) ||
                other.maternal == maternal) &&
            (identical(other.selectedNode, selectedNode) ||
                other.selectedNode == selectedNode) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, root, maternal, selectedNode, count);

  @override
  String toString() {
    return 'NodeTreeState(root: $root, maternal: $maternal, selectedNode: $selectedNode, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$NodeTreeStateCopyWith<$Res>
    implements $NodeTreeStateCopyWith<$Res> {
  factory _$NodeTreeStateCopyWith(
          _NodeTreeState value, $Res Function(_NodeTreeState) _then) =
      __$NodeTreeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PersonNode? root,
      PersonNode? maternal,
      PersonNode? selectedNode,
      int count});
}

/// @nodoc
class __$NodeTreeStateCopyWithImpl<$Res>
    implements _$NodeTreeStateCopyWith<$Res> {
  __$NodeTreeStateCopyWithImpl(this._self, this._then);

  final _NodeTreeState _self;
  final $Res Function(_NodeTreeState) _then;

  /// Create a copy of NodeTreeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? root = freezed,
    Object? maternal = freezed,
    Object? selectedNode = freezed,
    Object? count = null,
  }) {
    return _then(_NodeTreeState(
      root: freezed == root
          ? _self.root
          : root // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
      maternal: freezed == maternal
          ? _self.maternal
          : maternal // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
      selectedNode: freezed == selectedNode
          ? _self.selectedNode
          : selectedNode // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
