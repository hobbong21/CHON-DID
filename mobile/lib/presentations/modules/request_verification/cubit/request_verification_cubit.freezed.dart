// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestVerificationState {
  bool get isLoading;
  bool get isLoadingBlock;
  String get errorMessage;
  CardInfoItem? get card;

  /// Create a copy of RequestVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequestVerificationStateCopyWith<RequestVerificationState> get copyWith =>
      _$RequestVerificationStateCopyWithImpl<RequestVerificationState>(
          this as RequestVerificationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestVerificationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingBlock, isLoadingBlock) ||
                other.isLoadingBlock == isLoadingBlock) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isLoadingBlock, errorMessage, card);

  @override
  String toString() {
    return 'RequestVerificationState(isLoading: $isLoading, isLoadingBlock: $isLoadingBlock, errorMessage: $errorMessage, card: $card)';
  }
}

/// @nodoc
abstract mixin class $RequestVerificationStateCopyWith<$Res> {
  factory $RequestVerificationStateCopyWith(RequestVerificationState value,
          $Res Function(RequestVerificationState) _then) =
      _$RequestVerificationStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingBlock,
      String errorMessage,
      CardInfoItem? card});

  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class _$RequestVerificationStateCopyWithImpl<$Res>
    implements $RequestVerificationStateCopyWith<$Res> {
  _$RequestVerificationStateCopyWithImpl(this._self, this._then);

  final RequestVerificationState _self;
  final $Res Function(RequestVerificationState) _then;

  /// Create a copy of RequestVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingBlock = null,
    Object? errorMessage = null,
    Object? card = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBlock: null == isLoadingBlock
          ? _self.isLoadingBlock
          : isLoadingBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
    ));
  }

  /// Create a copy of RequestVerificationState
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

/// Adds pattern-matching-related methods to [RequestVerificationState].
extension RequestVerificationStatePatterns on RequestVerificationState {
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
    TResult Function(_RequestVerificationState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RequestVerificationState() when $default != null:
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
    TResult Function(_RequestVerificationState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestVerificationState():
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
    TResult? Function(_RequestVerificationState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestVerificationState() when $default != null:
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
    TResult Function(bool isLoading, bool isLoadingBlock, String errorMessage,
            CardInfoItem? card)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RequestVerificationState() when $default != null:
        return $default(_that.isLoading, _that.isLoadingBlock,
            _that.errorMessage, _that.card);
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
    TResult Function(bool isLoading, bool isLoadingBlock, String errorMessage,
            CardInfoItem? card)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestVerificationState():
        return $default(_that.isLoading, _that.isLoadingBlock,
            _that.errorMessage, _that.card);
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
    TResult? Function(bool isLoading, bool isLoadingBlock, String errorMessage,
            CardInfoItem? card)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestVerificationState() when $default != null:
        return $default(_that.isLoading, _that.isLoadingBlock,
            _that.errorMessage, _that.card);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RequestVerificationState implements RequestVerificationState {
  const _RequestVerificationState(
      {this.isLoading = false,
      this.isLoadingBlock = false,
      this.errorMessage = '',
      this.card});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingBlock;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final CardInfoItem? card;

  /// Create a copy of RequestVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestVerificationStateCopyWith<_RequestVerificationState> get copyWith =>
      __$RequestVerificationStateCopyWithImpl<_RequestVerificationState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestVerificationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingBlock, isLoadingBlock) ||
                other.isLoadingBlock == isLoadingBlock) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isLoadingBlock, errorMessage, card);

  @override
  String toString() {
    return 'RequestVerificationState(isLoading: $isLoading, isLoadingBlock: $isLoadingBlock, errorMessage: $errorMessage, card: $card)';
  }
}

/// @nodoc
abstract mixin class _$RequestVerificationStateCopyWith<$Res>
    implements $RequestVerificationStateCopyWith<$Res> {
  factory _$RequestVerificationStateCopyWith(_RequestVerificationState value,
          $Res Function(_RequestVerificationState) _then) =
      __$RequestVerificationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingBlock,
      String errorMessage,
      CardInfoItem? card});

  @override
  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class __$RequestVerificationStateCopyWithImpl<$Res>
    implements _$RequestVerificationStateCopyWith<$Res> {
  __$RequestVerificationStateCopyWithImpl(this._self, this._then);

  final _RequestVerificationState _self;
  final $Res Function(_RequestVerificationState) _then;

  /// Create a copy of RequestVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isLoadingBlock = null,
    Object? errorMessage = null,
    Object? card = freezed,
  }) {
    return _then(_RequestVerificationState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBlock: null == isLoadingBlock
          ? _self.isLoadingBlock
          : isLoadingBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
    ));
  }

  /// Create a copy of RequestVerificationState
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
