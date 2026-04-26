// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_contact_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InputContactState {
  bool get isLoading;
  String get errorMessage;
  RelationUserModel get relation;

  /// Create a copy of InputContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputContactStateCopyWith<InputContactState> get copyWith =>
      _$InputContactStateCopyWithImpl<InputContactState>(
          this as InputContactState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputContactState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.relation, relation) ||
                other.relation == relation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, errorMessage, relation);

  @override
  String toString() {
    return 'InputContactState(isLoading: $isLoading, errorMessage: $errorMessage, relation: $relation)';
  }
}

/// @nodoc
abstract mixin class $InputContactStateCopyWith<$Res> {
  factory $InputContactStateCopyWith(
          InputContactState value, $Res Function(InputContactState) _then) =
      _$InputContactStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, String errorMessage, RelationUserModel relation});

  $RelationUserModelCopyWith<$Res> get relation;
}

/// @nodoc
class _$InputContactStateCopyWithImpl<$Res>
    implements $InputContactStateCopyWith<$Res> {
  _$InputContactStateCopyWithImpl(this._self, this._then);

  final InputContactState _self;
  final $Res Function(InputContactState) _then;

  /// Create a copy of InputContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? relation = null,
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
      relation: null == relation
          ? _self.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as RelationUserModel,
    ));
  }

  /// Create a copy of InputContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res> get relation {
    return $RelationUserModelCopyWith<$Res>(_self.relation, (value) {
      return _then(_self.copyWith(relation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InputContactState].
extension InputContactStatePatterns on InputContactState {
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
    TResult Function(_InputContactState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputContactState() when $default != null:
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
    TResult Function(_InputContactState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputContactState():
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
    TResult? Function(_InputContactState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputContactState() when $default != null:
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
    TResult Function(
            bool isLoading, String errorMessage, RelationUserModel relation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InputContactState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.relation);
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
    TResult Function(
            bool isLoading, String errorMessage, RelationUserModel relation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputContactState():
        return $default(_that.isLoading, _that.errorMessage, _that.relation);
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
    TResult? Function(
            bool isLoading, String errorMessage, RelationUserModel relation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InputContactState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.relation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InputContactState implements InputContactState {
  _InputContactState(
      {this.isLoading = false,
      this.errorMessage = '',
      this.relation = const RelationUserModel()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final RelationUserModel relation;

  /// Create a copy of InputContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputContactStateCopyWith<_InputContactState> get copyWith =>
      __$InputContactStateCopyWithImpl<_InputContactState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputContactState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.relation, relation) ||
                other.relation == relation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, errorMessage, relation);

  @override
  String toString() {
    return 'InputContactState(isLoading: $isLoading, errorMessage: $errorMessage, relation: $relation)';
  }
}

/// @nodoc
abstract mixin class _$InputContactStateCopyWith<$Res>
    implements $InputContactStateCopyWith<$Res> {
  factory _$InputContactStateCopyWith(
          _InputContactState value, $Res Function(_InputContactState) _then) =
      __$InputContactStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, String errorMessage, RelationUserModel relation});

  @override
  $RelationUserModelCopyWith<$Res> get relation;
}

/// @nodoc
class __$InputContactStateCopyWithImpl<$Res>
    implements _$InputContactStateCopyWith<$Res> {
  __$InputContactStateCopyWithImpl(this._self, this._then);

  final _InputContactState _self;
  final $Res Function(_InputContactState) _then;

  /// Create a copy of InputContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? relation = null,
  }) {
    return _then(_InputContactState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      relation: null == relation
          ? _self.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as RelationUserModel,
    ));
  }

  /// Create a copy of InputContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res> get relation {
    return $RelationUserModelCopyWith<$Res>(_self.relation, (value) {
      return _then(_self.copyWith(relation: value));
    });
  }
}

// dart format on
