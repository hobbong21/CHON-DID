// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FamilyListState {
  bool get isLoading;
  String get errorMessage;
  List<RelationUserModel> get relations;

  /// Create a copy of FamilyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FamilyListStateCopyWith<FamilyListState> get copyWith =>
      _$FamilyListStateCopyWithImpl<FamilyListState>(
          this as FamilyListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FamilyListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.relations, relations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      const DeepCollectionEquality().hash(relations));

  @override
  String toString() {
    return 'FamilyListState(isLoading: $isLoading, errorMessage: $errorMessage, relations: $relations)';
  }
}

/// @nodoc
abstract mixin class $FamilyListStateCopyWith<$Res> {
  factory $FamilyListStateCopyWith(
          FamilyListState value, $Res Function(FamilyListState) _then) =
      _$FamilyListStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading, String errorMessage, List<RelationUserModel> relations});
}

/// @nodoc
class _$FamilyListStateCopyWithImpl<$Res>
    implements $FamilyListStateCopyWith<$Res> {
  _$FamilyListStateCopyWithImpl(this._self, this._then);

  final FamilyListState _self;
  final $Res Function(FamilyListState) _then;

  /// Create a copy of FamilyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? relations = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      relations: null == relations
          ? _self.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FamilyListState].
extension FamilyListStatePatterns on FamilyListState {
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
    TResult Function(_FamilyListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FamilyListState() when $default != null:
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
    TResult Function(_FamilyListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyListState():
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
    TResult? Function(_FamilyListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyListState() when $default != null:
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
    TResult Function(bool isLoading, String errorMessage,
            List<RelationUserModel> relations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FamilyListState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.relations);
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
    TResult Function(bool isLoading, String errorMessage,
            List<RelationUserModel> relations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyListState():
        return $default(_that.isLoading, _that.errorMessage, _that.relations);
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
    TResult? Function(bool isLoading, String errorMessage,
            List<RelationUserModel> relations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyListState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.relations);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FamilyListState implements FamilyListState {
  _FamilyListState(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<RelationUserModel> relations = const []})
      : _relations = relations;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<RelationUserModel> _relations;
  @override
  @JsonKey()
  List<RelationUserModel> get relations {
    if (_relations is EqualUnmodifiableListView) return _relations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relations);
  }

  /// Create a copy of FamilyListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FamilyListStateCopyWith<_FamilyListState> get copyWith =>
      __$FamilyListStateCopyWithImpl<_FamilyListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FamilyListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._relations, _relations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      const DeepCollectionEquality().hash(_relations));

  @override
  String toString() {
    return 'FamilyListState(isLoading: $isLoading, errorMessage: $errorMessage, relations: $relations)';
  }
}

/// @nodoc
abstract mixin class _$FamilyListStateCopyWith<$Res>
    implements $FamilyListStateCopyWith<$Res> {
  factory _$FamilyListStateCopyWith(
          _FamilyListState value, $Res Function(_FamilyListState) _then) =
      __$FamilyListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading, String errorMessage, List<RelationUserModel> relations});
}

/// @nodoc
class __$FamilyListStateCopyWithImpl<$Res>
    implements _$FamilyListStateCopyWith<$Res> {
  __$FamilyListStateCopyWithImpl(this._self, this._then);

  final _FamilyListState _self;
  final $Res Function(_FamilyListState) _then;

  /// Create a copy of FamilyListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? relations = null,
  }) {
    return _then(_FamilyListState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      relations: null == relations
          ? _self._relations
          : relations // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
    ));
  }
}

// dart format on
