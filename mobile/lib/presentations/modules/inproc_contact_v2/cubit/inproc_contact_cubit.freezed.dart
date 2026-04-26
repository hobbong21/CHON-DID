// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inproc_contact_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InProcContactState {
  InProcContactStage get stage;
  String get contactName;
  String get contactPhone;
  String get errorMessage;

  /// Time when [start] was called, used by the UI to render the elapsed
  /// timer on the InProgress screen.
  DateTime? get startedAt;

  /// Create a copy of InProcContactState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InProcContactStateCopyWith<InProcContactState> get copyWith =>
      _$InProcContactStateCopyWithImpl<InProcContactState>(
          this as InProcContactState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InProcContactState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, stage, contactName, contactPhone, errorMessage, startedAt);

  @override
  String toString() {
    return 'InProcContactState(stage: $stage, contactName: $contactName, contactPhone: $contactPhone, errorMessage: $errorMessage, startedAt: $startedAt)';
  }
}

/// @nodoc
abstract mixin class $InProcContactStateCopyWith<$Res> {
  factory $InProcContactStateCopyWith(
          InProcContactState value, $Res Function(InProcContactState) _then) =
      _$InProcContactStateCopyWithImpl;
  @useResult
  $Res call(
      {InProcContactStage stage,
      String contactName,
      String contactPhone,
      String errorMessage,
      DateTime? startedAt});
}

/// @nodoc
class _$InProcContactStateCopyWithImpl<$Res>
    implements $InProcContactStateCopyWith<$Res> {
  _$InProcContactStateCopyWithImpl(this._self, this._then);

  final InProcContactState _self;
  final $Res Function(InProcContactState) _then;

  /// Create a copy of InProcContactState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? contactName = null,
    Object? contactPhone = null,
    Object? errorMessage = null,
    Object? startedAt = freezed,
  }) {
    return _then(_self.copyWith(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as InProcContactStage,
      contactName: null == contactName
          ? _self.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: null == contactPhone
          ? _self.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InProcContactState].
extension InProcContactStatePatterns on InProcContactState {
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
    TResult Function(_InProcContactState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InProcContactState() when $default != null:
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
    TResult Function(_InProcContactState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InProcContactState():
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
    TResult? Function(_InProcContactState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InProcContactState() when $default != null:
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
    TResult Function(InProcContactStage stage, String contactName,
            String contactPhone, String errorMessage, DateTime? startedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InProcContactState() when $default != null:
        return $default(_that.stage, _that.contactName, _that.contactPhone,
            _that.errorMessage, _that.startedAt);
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
    TResult Function(InProcContactStage stage, String contactName,
            String contactPhone, String errorMessage, DateTime? startedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InProcContactState():
        return $default(_that.stage, _that.contactName, _that.contactPhone,
            _that.errorMessage, _that.startedAt);
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
    TResult? Function(InProcContactStage stage, String contactName,
            String contactPhone, String errorMessage, DateTime? startedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InProcContactState() when $default != null:
        return $default(_that.stage, _that.contactName, _that.contactPhone,
            _that.errorMessage, _that.startedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InProcContactState implements InProcContactState {
  _InProcContactState(
      {this.stage = InProcContactStage.idle,
      this.contactName = '',
      this.contactPhone = '',
      this.errorMessage = '',
      this.startedAt = null});

  @override
  @JsonKey()
  final InProcContactStage stage;
  @override
  @JsonKey()
  final String contactName;
  @override
  @JsonKey()
  final String contactPhone;
  @override
  @JsonKey()
  final String errorMessage;

  /// Time when [start] was called, used by the UI to render the elapsed
  /// timer on the InProgress screen.
  @override
  @JsonKey()
  final DateTime? startedAt;

  /// Create a copy of InProcContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InProcContactStateCopyWith<_InProcContactState> get copyWith =>
      __$InProcContactStateCopyWithImpl<_InProcContactState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InProcContactState &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, stage, contactName, contactPhone, errorMessage, startedAt);

  @override
  String toString() {
    return 'InProcContactState(stage: $stage, contactName: $contactName, contactPhone: $contactPhone, errorMessage: $errorMessage, startedAt: $startedAt)';
  }
}

/// @nodoc
abstract mixin class _$InProcContactStateCopyWith<$Res>
    implements $InProcContactStateCopyWith<$Res> {
  factory _$InProcContactStateCopyWith(
          _InProcContactState value, $Res Function(_InProcContactState) _then) =
      __$InProcContactStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {InProcContactStage stage,
      String contactName,
      String contactPhone,
      String errorMessage,
      DateTime? startedAt});
}

/// @nodoc
class __$InProcContactStateCopyWithImpl<$Res>
    implements _$InProcContactStateCopyWith<$Res> {
  __$InProcContactStateCopyWithImpl(this._self, this._then);

  final _InProcContactState _self;
  final $Res Function(_InProcContactState) _then;

  /// Create a copy of InProcContactState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stage = null,
    Object? contactName = null,
    Object? contactPhone = null,
    Object? errorMessage = null,
    Object? startedAt = freezed,
  }) {
    return _then(_InProcContactState(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as InProcContactStage,
      contactName: null == contactName
          ? _self.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: null == contactPhone
          ? _self.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
