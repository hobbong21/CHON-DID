// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutual_auth_offline_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MutualAuthOfflineState {
  MutualAuthOfflineStage get stage;
  bool get isLoading;
  String get errorMessage;

  /// On `displaying`, the QR string that gets rendered.
  String? get displayQr;

  /// On `result`, the card decoded from a scan.
  CardInfoItem? get scannedCard;

  /// Create a copy of MutualAuthOfflineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MutualAuthOfflineStateCopyWith<MutualAuthOfflineState> get copyWith =>
      _$MutualAuthOfflineStateCopyWithImpl<MutualAuthOfflineState>(
          this as MutualAuthOfflineState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MutualAuthOfflineState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.displayQr, displayQr) ||
                other.displayQr == displayQr) &&
            (identical(other.scannedCard, scannedCard) ||
                other.scannedCard == scannedCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, stage, isLoading, errorMessage, displayQr, scannedCard);

  @override
  String toString() {
    return 'MutualAuthOfflineState(stage: $stage, isLoading: $isLoading, errorMessage: $errorMessage, displayQr: $displayQr, scannedCard: $scannedCard)';
  }
}

/// @nodoc
abstract mixin class $MutualAuthOfflineStateCopyWith<$Res> {
  factory $MutualAuthOfflineStateCopyWith(MutualAuthOfflineState value,
          $Res Function(MutualAuthOfflineState) _then) =
      _$MutualAuthOfflineStateCopyWithImpl;
  @useResult
  $Res call(
      {MutualAuthOfflineStage stage,
      bool isLoading,
      String errorMessage,
      String? displayQr,
      CardInfoItem? scannedCard});

  $CardInfoItemCopyWith<$Res>? get scannedCard;
}

/// @nodoc
class _$MutualAuthOfflineStateCopyWithImpl<$Res>
    implements $MutualAuthOfflineStateCopyWith<$Res> {
  _$MutualAuthOfflineStateCopyWithImpl(this._self, this._then);

  final MutualAuthOfflineState _self;
  final $Res Function(MutualAuthOfflineState) _then;

  /// Create a copy of MutualAuthOfflineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? displayQr = freezed,
    Object? scannedCard = freezed,
  }) {
    return _then(_self.copyWith(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as MutualAuthOfflineStage,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      displayQr: freezed == displayQr
          ? _self.displayQr
          : displayQr // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedCard: freezed == scannedCard
          ? _self.scannedCard
          : scannedCard // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
    ));
  }

  /// Create a copy of MutualAuthOfflineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get scannedCard {
    if (_self.scannedCard == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.scannedCard!, (value) {
      return _then(_self.copyWith(scannedCard: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MutualAuthOfflineState].
extension MutualAuthOfflineStatePatterns on MutualAuthOfflineState {
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
    TResult Function(_MutualAuthOfflineState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MutualAuthOfflineState() when $default != null:
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
    TResult Function(_MutualAuthOfflineState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthOfflineState():
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
    TResult? Function(_MutualAuthOfflineState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthOfflineState() when $default != null:
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
    TResult Function(MutualAuthOfflineStage stage, bool isLoading,
            String errorMessage, String? displayQr, CardInfoItem? scannedCard)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MutualAuthOfflineState() when $default != null:
        return $default(_that.stage, _that.isLoading, _that.errorMessage,
            _that.displayQr, _that.scannedCard);
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
    TResult Function(MutualAuthOfflineStage stage, bool isLoading,
            String errorMessage, String? displayQr, CardInfoItem? scannedCard)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthOfflineState():
        return $default(_that.stage, _that.isLoading, _that.errorMessage,
            _that.displayQr, _that.scannedCard);
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
    TResult? Function(MutualAuthOfflineStage stage, bool isLoading,
            String errorMessage, String? displayQr, CardInfoItem? scannedCard)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthOfflineState() when $default != null:
        return $default(_that.stage, _that.isLoading, _that.errorMessage,
            _that.displayQr, _that.scannedCard);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MutualAuthOfflineState implements MutualAuthOfflineState {
  _MutualAuthOfflineState(
      {this.stage = MutualAuthOfflineStage.idle,
      this.isLoading = false,
      this.errorMessage = '',
      this.displayQr = null,
      this.scannedCard = null});

  @override
  @JsonKey()
  final MutualAuthOfflineStage stage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  /// On `displaying`, the QR string that gets rendered.
  @override
  @JsonKey()
  final String? displayQr;

  /// On `result`, the card decoded from a scan.
  @override
  @JsonKey()
  final CardInfoItem? scannedCard;

  /// Create a copy of MutualAuthOfflineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MutualAuthOfflineStateCopyWith<_MutualAuthOfflineState> get copyWith =>
      __$MutualAuthOfflineStateCopyWithImpl<_MutualAuthOfflineState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MutualAuthOfflineState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.displayQr, displayQr) ||
                other.displayQr == displayQr) &&
            (identical(other.scannedCard, scannedCard) ||
                other.scannedCard == scannedCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, stage, isLoading, errorMessage, displayQr, scannedCard);

  @override
  String toString() {
    return 'MutualAuthOfflineState(stage: $stage, isLoading: $isLoading, errorMessage: $errorMessage, displayQr: $displayQr, scannedCard: $scannedCard)';
  }
}

/// @nodoc
abstract mixin class _$MutualAuthOfflineStateCopyWith<$Res>
    implements $MutualAuthOfflineStateCopyWith<$Res> {
  factory _$MutualAuthOfflineStateCopyWith(_MutualAuthOfflineState value,
          $Res Function(_MutualAuthOfflineState) _then) =
      __$MutualAuthOfflineStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MutualAuthOfflineStage stage,
      bool isLoading,
      String errorMessage,
      String? displayQr,
      CardInfoItem? scannedCard});

  @override
  $CardInfoItemCopyWith<$Res>? get scannedCard;
}

/// @nodoc
class __$MutualAuthOfflineStateCopyWithImpl<$Res>
    implements _$MutualAuthOfflineStateCopyWith<$Res> {
  __$MutualAuthOfflineStateCopyWithImpl(this._self, this._then);

  final _MutualAuthOfflineState _self;
  final $Res Function(_MutualAuthOfflineState) _then;

  /// Create a copy of MutualAuthOfflineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stage = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? displayQr = freezed,
    Object? scannedCard = freezed,
  }) {
    return _then(_MutualAuthOfflineState(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as MutualAuthOfflineStage,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      displayQr: freezed == displayQr
          ? _self.displayQr
          : displayQr // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedCard: freezed == scannedCard
          ? _self.scannedCard
          : scannedCard // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
    ));
  }

  /// Create a copy of MutualAuthOfflineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardInfoItemCopyWith<$Res>? get scannedCard {
    if (_self.scannedCard == null) {
      return null;
    }

    return $CardInfoItemCopyWith<$Res>(_self.scannedCard!, (value) {
      return _then(_self.copyWith(scannedCard: value));
    });
  }
}

// dart format on
