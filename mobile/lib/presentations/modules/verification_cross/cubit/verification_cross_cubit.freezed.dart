// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_cross_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationCrossState {
  bool get isLoading;
  String get errorMessage;
  List<RelationUserModel> get relations;
  CardInfoItem? get card;

  /// Create a copy of VerificationCrossState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerificationCrossStateCopyWith<VerificationCrossState> get copyWith =>
      _$VerificationCrossStateCopyWithImpl<VerificationCrossState>(
          this as VerificationCrossState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationCrossState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.relations, relations) &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      const DeepCollectionEquality().hash(relations), card);

  @override
  String toString() {
    return 'VerificationCrossState(isLoading: $isLoading, errorMessage: $errorMessage, relations: $relations, card: $card)';
  }
}

/// @nodoc
abstract mixin class $VerificationCrossStateCopyWith<$Res> {
  factory $VerificationCrossStateCopyWith(VerificationCrossState value,
          $Res Function(VerificationCrossState) _then) =
      _$VerificationCrossStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<RelationUserModel> relations,
      CardInfoItem? card});

  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class _$VerificationCrossStateCopyWithImpl<$Res>
    implements $VerificationCrossStateCopyWith<$Res> {
  _$VerificationCrossStateCopyWithImpl(this._self, this._then);

  final VerificationCrossState _self;
  final $Res Function(VerificationCrossState) _then;

  /// Create a copy of VerificationCrossState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? relations = null,
    Object? card = freezed,
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
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
    ));
  }

  /// Create a copy of VerificationCrossState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get card {
    if (_self.card == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.card!, (value) {
      return _then(_self.copyWith(card: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VerificationCrossState].
extension VerificationCrossStatePatterns on VerificationCrossState {
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
    TResult Function(_VerificationCrossState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerificationCrossState() when $default != null:
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
    TResult Function(_VerificationCrossState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationCrossState():
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
    TResult? Function(_VerificationCrossState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationCrossState() when $default != null:
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
            List<RelationUserModel> relations, CardInfoItem? card)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerificationCrossState() when $default != null:
        return $default(
            _that.isLoading, _that.errorMessage, _that.relations, _that.card);
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
            List<RelationUserModel> relations, CardInfoItem? card)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationCrossState():
        return $default(
            _that.isLoading, _that.errorMessage, _that.relations, _that.card);
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
            List<RelationUserModel> relations, CardInfoItem? card)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerificationCrossState() when $default != null:
        return $default(
            _that.isLoading, _that.errorMessage, _that.relations, _that.card);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VerificationCrossState implements VerificationCrossState {
  _VerificationCrossState(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<RelationUserModel> relations = const [],
      this.card})
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

  @override
  final CardInfoItem? card;

  /// Create a copy of VerificationCrossState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerificationCrossStateCopyWith<_VerificationCrossState> get copyWith =>
      __$VerificationCrossStateCopyWithImpl<_VerificationCrossState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerificationCrossState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._relations, _relations) &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      const DeepCollectionEquality().hash(_relations), card);

  @override
  String toString() {
    return 'VerificationCrossState(isLoading: $isLoading, errorMessage: $errorMessage, relations: $relations, card: $card)';
  }
}

/// @nodoc
abstract mixin class _$VerificationCrossStateCopyWith<$Res>
    implements $VerificationCrossStateCopyWith<$Res> {
  factory _$VerificationCrossStateCopyWith(_VerificationCrossState value,
          $Res Function(_VerificationCrossState) _then) =
      __$VerificationCrossStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<RelationUserModel> relations,
      CardInfoItem? card});

  @override
  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class __$VerificationCrossStateCopyWithImpl<$Res>
    implements _$VerificationCrossStateCopyWith<$Res> {
  __$VerificationCrossStateCopyWithImpl(this._self, this._then);

  final _VerificationCrossState _self;
  final $Res Function(_VerificationCrossState) _then;

  /// Create a copy of VerificationCrossState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? relations = null,
    Object? card = freezed,
  }) {
    return _then(_VerificationCrossState(
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
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
    ));
  }

  /// Create a copy of VerificationCrossState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get card {
    if (_self.card == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.card!, (value) {
      return _then(_self.copyWith(card: value));
    });
  }
}

// dart format on
