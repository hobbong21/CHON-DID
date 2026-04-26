// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutual_auth_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MutualAuthRequestState {
  MutualAuthRequestStage get stage;
  String get phoneInput;
  bool get isLoading;
  String get errorMessage;

  /// Set after a successful search — the user we'll request auth from.
  RelationUserModel? get target;

  /// Final approval state populated when stage is `responded`.
  bool? get wasApproved;

  /// Create a copy of MutualAuthRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MutualAuthRequestStateCopyWith<MutualAuthRequestState> get copyWith =>
      _$MutualAuthRequestStateCopyWithImpl<MutualAuthRequestState>(
          this as MutualAuthRequestState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MutualAuthRequestState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.phoneInput, phoneInput) ||
                other.phoneInput == phoneInput) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.wasApproved, wasApproved) ||
                other.wasApproved == wasApproved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage, phoneInput, isLoading,
      errorMessage, target, wasApproved);

  @override
  String toString() {
    return 'MutualAuthRequestState(stage: $stage, phoneInput: $phoneInput, isLoading: $isLoading, errorMessage: $errorMessage, target: $target, wasApproved: $wasApproved)';
  }
}

/// @nodoc
abstract mixin class $MutualAuthRequestStateCopyWith<$Res> {
  factory $MutualAuthRequestStateCopyWith(MutualAuthRequestState value,
          $Res Function(MutualAuthRequestState) _then) =
      _$MutualAuthRequestStateCopyWithImpl;
  @useResult
  $Res call(
      {MutualAuthRequestStage stage,
      String phoneInput,
      bool isLoading,
      String errorMessage,
      RelationUserModel? target,
      bool? wasApproved});

  $RelationUserModelCopyWith<$Res>? get target;
}

/// @nodoc
class _$MutualAuthRequestStateCopyWithImpl<$Res>
    implements $MutualAuthRequestStateCopyWith<$Res> {
  _$MutualAuthRequestStateCopyWithImpl(this._self, this._then);

  final MutualAuthRequestState _self;
  final $Res Function(MutualAuthRequestState) _then;

  /// Create a copy of MutualAuthRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? phoneInput = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? target = freezed,
    Object? wasApproved = freezed,
  }) {
    return _then(_self.copyWith(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as MutualAuthRequestStage,
      phoneInput: null == phoneInput
          ? _self.phoneInput
          : phoneInput // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as RelationUserModel?,
      wasApproved: freezed == wasApproved
          ? _self.wasApproved
          : wasApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of MutualAuthRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res>? get target {
    if (_self.target == null) {
      return null;
    }

    return $RelationUserModelCopyWith<$Res>(_self.target!, (value) {
      return _then(_self.copyWith(target: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MutualAuthRequestState].
extension MutualAuthRequestStatePatterns on MutualAuthRequestState {
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
    TResult Function(_MutualAuthRequestState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MutualAuthRequestState() when $default != null:
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
    TResult Function(_MutualAuthRequestState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthRequestState():
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
    TResult? Function(_MutualAuthRequestState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthRequestState() when $default != null:
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
            MutualAuthRequestStage stage,
            String phoneInput,
            bool isLoading,
            String errorMessage,
            RelationUserModel? target,
            bool? wasApproved)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MutualAuthRequestState() when $default != null:
        return $default(_that.stage, _that.phoneInput, _that.isLoading,
            _that.errorMessage, _that.target, _that.wasApproved);
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
            MutualAuthRequestStage stage,
            String phoneInput,
            bool isLoading,
            String errorMessage,
            RelationUserModel? target,
            bool? wasApproved)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthRequestState():
        return $default(_that.stage, _that.phoneInput, _that.isLoading,
            _that.errorMessage, _that.target, _that.wasApproved);
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
            MutualAuthRequestStage stage,
            String phoneInput,
            bool isLoading,
            String errorMessage,
            RelationUserModel? target,
            bool? wasApproved)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthRequestState() when $default != null:
        return $default(_that.stage, _that.phoneInput, _that.isLoading,
            _that.errorMessage, _that.target, _that.wasApproved);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MutualAuthRequestState implements MutualAuthRequestState {
  _MutualAuthRequestState(
      {this.stage = MutualAuthRequestStage.search,
      this.phoneInput = '',
      this.isLoading = false,
      this.errorMessage = '',
      this.target = null,
      this.wasApproved = false});

  @override
  @JsonKey()
  final MutualAuthRequestStage stage;
  @override
  @JsonKey()
  final String phoneInput;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  /// Set after a successful search — the user we'll request auth from.
  @override
  @JsonKey()
  final RelationUserModel? target;

  /// Final approval state populated when stage is `responded`.
  @override
  @JsonKey()
  final bool? wasApproved;

  /// Create a copy of MutualAuthRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MutualAuthRequestStateCopyWith<_MutualAuthRequestState> get copyWith =>
      __$MutualAuthRequestStateCopyWithImpl<_MutualAuthRequestState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MutualAuthRequestState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.phoneInput, phoneInput) ||
                other.phoneInput == phoneInput) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.wasApproved, wasApproved) ||
                other.wasApproved == wasApproved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage, phoneInput, isLoading,
      errorMessage, target, wasApproved);

  @override
  String toString() {
    return 'MutualAuthRequestState(stage: $stage, phoneInput: $phoneInput, isLoading: $isLoading, errorMessage: $errorMessage, target: $target, wasApproved: $wasApproved)';
  }
}

/// @nodoc
abstract mixin class _$MutualAuthRequestStateCopyWith<$Res>
    implements $MutualAuthRequestStateCopyWith<$Res> {
  factory _$MutualAuthRequestStateCopyWith(_MutualAuthRequestState value,
          $Res Function(_MutualAuthRequestState) _then) =
      __$MutualAuthRequestStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MutualAuthRequestStage stage,
      String phoneInput,
      bool isLoading,
      String errorMessage,
      RelationUserModel? target,
      bool? wasApproved});

  @override
  $RelationUserModelCopyWith<$Res>? get target;
}

/// @nodoc
class __$MutualAuthRequestStateCopyWithImpl<$Res>
    implements _$MutualAuthRequestStateCopyWith<$Res> {
  __$MutualAuthRequestStateCopyWithImpl(this._self, this._then);

  final _MutualAuthRequestState _self;
  final $Res Function(_MutualAuthRequestState) _then;

  /// Create a copy of MutualAuthRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stage = null,
    Object? phoneInput = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? target = freezed,
    Object? wasApproved = freezed,
  }) {
    return _then(_MutualAuthRequestState(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as MutualAuthRequestStage,
      phoneInput: null == phoneInput
          ? _self.phoneInput
          : phoneInput // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as RelationUserModel?,
      wasApproved: freezed == wasApproved
          ? _self.wasApproved
          : wasApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of MutualAuthRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res>? get target {
    if (_self.target == null) {
      return null;
    }

    return $RelationUserModelCopyWith<$Res>(_self.target!, (value) {
      return _then(_self.copyWith(target: value));
    });
  }
}

// dart format on
