// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_out_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInOutState {
  bool get isLoading;
  String get errorMessage;
  bool get isVisiting;
  CardInfoItem? get card;
  VisitEventModel? get visitResult;

  /// Create a copy of CheckInOutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckInOutStateCopyWith<CheckInOutState> get copyWith =>
      _$CheckInOutStateCopyWithImpl<CheckInOutState>(
          this as CheckInOutState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckInOutState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isVisiting, isVisiting) ||
                other.isVisiting == isVisiting) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.visitResult, visitResult) ||
                other.visitResult == visitResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, errorMessage, isVisiting, card, visitResult);

  @override
  String toString() {
    return 'CheckInOutState(isLoading: $isLoading, errorMessage: $errorMessage, isVisiting: $isVisiting, card: $card, visitResult: $visitResult)';
  }
}

/// @nodoc
abstract mixin class $CheckInOutStateCopyWith<$Res> {
  factory $CheckInOutStateCopyWith(
          CheckInOutState value, $Res Function(CheckInOutState) _then) =
      _$CheckInOutStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      bool isVisiting,
      CardInfoItem? card,
      VisitEventModel? visitResult});

  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class _$CheckInOutStateCopyWithImpl<$Res>
    implements $CheckInOutStateCopyWith<$Res> {
  _$CheckInOutStateCopyWithImpl(this._self, this._then);

  final CheckInOutState _self;
  final $Res Function(CheckInOutState) _then;

  /// Create a copy of CheckInOutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? isVisiting = null,
    Object? card = freezed,
    Object? visitResult = freezed,
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
      isVisiting: null == isVisiting
          ? _self.isVisiting
          : isVisiting // ignore: cast_nullable_to_non_nullable
              as bool,
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      visitResult: freezed == visitResult
          ? _self.visitResult
          : visitResult // ignore: cast_nullable_to_non_nullable
              as VisitEventModel?,
    ));
  }

  /// Create a copy of CheckInOutState
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

/// Adds pattern-matching-related methods to [CheckInOutState].
extension CheckInOutStatePatterns on CheckInOutState {
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
    TResult Function(_CheckInOutState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckInOutState() when $default != null:
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
    TResult Function(_CheckInOutState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckInOutState():
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
    TResult? Function(_CheckInOutState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckInOutState() when $default != null:
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
    TResult Function(bool isLoading, String errorMessage, bool isVisiting,
            CardInfoItem? card, VisitEventModel? visitResult)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckInOutState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.isVisiting,
            _that.card, _that.visitResult);
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
    TResult Function(bool isLoading, String errorMessage, bool isVisiting,
            CardInfoItem? card, VisitEventModel? visitResult)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckInOutState():
        return $default(_that.isLoading, _that.errorMessage, _that.isVisiting,
            _that.card, _that.visitResult);
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
    TResult? Function(bool isLoading, String errorMessage, bool isVisiting,
            CardInfoItem? card, VisitEventModel? visitResult)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CheckInOutState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.isVisiting,
            _that.card, _that.visitResult);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CheckInOutState implements CheckInOutState {
  const _CheckInOutState(
      {this.isLoading = false,
      this.errorMessage = '',
      this.isVisiting = false,
      this.card,
      this.visitResult});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isVisiting;
  @override
  final CardInfoItem? card;
  @override
  final VisitEventModel? visitResult;

  /// Create a copy of CheckInOutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckInOutStateCopyWith<_CheckInOutState> get copyWith =>
      __$CheckInOutStateCopyWithImpl<_CheckInOutState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckInOutState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isVisiting, isVisiting) ||
                other.isVisiting == isVisiting) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.visitResult, visitResult) ||
                other.visitResult == visitResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, errorMessage, isVisiting, card, visitResult);

  @override
  String toString() {
    return 'CheckInOutState(isLoading: $isLoading, errorMessage: $errorMessage, isVisiting: $isVisiting, card: $card, visitResult: $visitResult)';
  }
}

/// @nodoc
abstract mixin class _$CheckInOutStateCopyWith<$Res>
    implements $CheckInOutStateCopyWith<$Res> {
  factory _$CheckInOutStateCopyWith(
          _CheckInOutState value, $Res Function(_CheckInOutState) _then) =
      __$CheckInOutStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      bool isVisiting,
      CardInfoItem? card,
      VisitEventModel? visitResult});

  @override
  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class __$CheckInOutStateCopyWithImpl<$Res>
    implements _$CheckInOutStateCopyWith<$Res> {
  __$CheckInOutStateCopyWithImpl(this._self, this._then);

  final _CheckInOutState _self;
  final $Res Function(_CheckInOutState) _then;

  /// Create a copy of CheckInOutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? isVisiting = null,
    Object? card = freezed,
    Object? visitResult = freezed,
  }) {
    return _then(_CheckInOutState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isVisiting: null == isVisiting
          ? _self.isVisiting
          : isVisiting // ignore: cast_nullable_to_non_nullable
              as bool,
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      visitResult: freezed == visitResult
          ? _self.visitResult
          : visitResult // ignore: cast_nullable_to_non_nullable
              as VisitEventModel?,
    ));
  }

  /// Create a copy of CheckInOutState
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
