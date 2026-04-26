// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutual_auth_receive_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MutualAuthReceiveState {
  bool get isLoading;
  String get errorMessage;
  List<RelationUserModel> get requests;

  /// Currently focused request (sheet open).
  RelationUserModel? get selected;

  /// One of: idle, approving, rejecting, approved, rejected.
  MutualAuthReceiveStage get stage;

  /// Create a copy of MutualAuthReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MutualAuthReceiveStateCopyWith<MutualAuthReceiveState> get copyWith =>
      _$MutualAuthReceiveStateCopyWithImpl<MutualAuthReceiveState>(
          this as MutualAuthReceiveState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MutualAuthReceiveState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.requests, requests) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      const DeepCollectionEquality().hash(requests), selected, stage);

  @override
  String toString() {
    return 'MutualAuthReceiveState(isLoading: $isLoading, errorMessage: $errorMessage, requests: $requests, selected: $selected, stage: $stage)';
  }
}

/// @nodoc
abstract mixin class $MutualAuthReceiveStateCopyWith<$Res> {
  factory $MutualAuthReceiveStateCopyWith(MutualAuthReceiveState value,
          $Res Function(MutualAuthReceiveState) _then) =
      _$MutualAuthReceiveStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<RelationUserModel> requests,
      RelationUserModel? selected,
      MutualAuthReceiveStage stage});

  $RelationUserModelCopyWith<$Res>? get selected;
}

/// @nodoc
class _$MutualAuthReceiveStateCopyWithImpl<$Res>
    implements $MutualAuthReceiveStateCopyWith<$Res> {
  _$MutualAuthReceiveStateCopyWithImpl(this._self, this._then);

  final MutualAuthReceiveState _self;
  final $Res Function(MutualAuthReceiveState) _then;

  /// Create a copy of MutualAuthReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? requests = null,
    Object? selected = freezed,
    Object? stage = null,
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
      requests: null == requests
          ? _self.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
      selected: freezed == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as RelationUserModel?,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as MutualAuthReceiveStage,
    ));
  }

  /// Create a copy of MutualAuthReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res>? get selected {
    if (_self.selected == null) {
      return null;
    }

    return $RelationUserModelCopyWith<$Res>(_self.selected!, (value) {
      return _then(_self.copyWith(selected: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MutualAuthReceiveState].
extension MutualAuthReceiveStatePatterns on MutualAuthReceiveState {
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
    TResult Function(_MutualAuthReceiveState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MutualAuthReceiveState() when $default != null:
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
    TResult Function(_MutualAuthReceiveState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthReceiveState():
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
    TResult? Function(_MutualAuthReceiveState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthReceiveState() when $default != null:
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
            bool isLoading,
            String errorMessage,
            List<RelationUserModel> requests,
            RelationUserModel? selected,
            MutualAuthReceiveStage stage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MutualAuthReceiveState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.requests,
            _that.selected, _that.stage);
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
            bool isLoading,
            String errorMessage,
            List<RelationUserModel> requests,
            RelationUserModel? selected,
            MutualAuthReceiveStage stage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthReceiveState():
        return $default(_that.isLoading, _that.errorMessage, _that.requests,
            _that.selected, _that.stage);
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
            bool isLoading,
            String errorMessage,
            List<RelationUserModel> requests,
            RelationUserModel? selected,
            MutualAuthReceiveStage stage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MutualAuthReceiveState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.requests,
            _that.selected, _that.stage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MutualAuthReceiveState implements MutualAuthReceiveState {
  _MutualAuthReceiveState(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<RelationUserModel> requests = const [],
      this.selected = null,
      this.stage = MutualAuthReceiveStage.idle})
      : _requests = requests;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<RelationUserModel> _requests;
  @override
  @JsonKey()
  List<RelationUserModel> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  /// Currently focused request (sheet open).
  @override
  @JsonKey()
  final RelationUserModel? selected;

  /// One of: idle, approving, rejecting, approved, rejected.
  @override
  @JsonKey()
  final MutualAuthReceiveStage stage;

  /// Create a copy of MutualAuthReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MutualAuthReceiveStateCopyWith<_MutualAuthReceiveState> get copyWith =>
      __$MutualAuthReceiveStateCopyWithImpl<_MutualAuthReceiveState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MutualAuthReceiveState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, errorMessage,
      const DeepCollectionEquality().hash(_requests), selected, stage);

  @override
  String toString() {
    return 'MutualAuthReceiveState(isLoading: $isLoading, errorMessage: $errorMessage, requests: $requests, selected: $selected, stage: $stage)';
  }
}

/// @nodoc
abstract mixin class _$MutualAuthReceiveStateCopyWith<$Res>
    implements $MutualAuthReceiveStateCopyWith<$Res> {
  factory _$MutualAuthReceiveStateCopyWith(_MutualAuthReceiveState value,
          $Res Function(_MutualAuthReceiveState) _then) =
      __$MutualAuthReceiveStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<RelationUserModel> requests,
      RelationUserModel? selected,
      MutualAuthReceiveStage stage});

  @override
  $RelationUserModelCopyWith<$Res>? get selected;
}

/// @nodoc
class __$MutualAuthReceiveStateCopyWithImpl<$Res>
    implements _$MutualAuthReceiveStateCopyWith<$Res> {
  __$MutualAuthReceiveStateCopyWithImpl(this._self, this._then);

  final _MutualAuthReceiveState _self;
  final $Res Function(_MutualAuthReceiveState) _then;

  /// Create a copy of MutualAuthReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? requests = null,
    Object? selected = freezed,
    Object? stage = null,
  }) {
    return _then(_MutualAuthReceiveState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      requests: null == requests
          ? _self._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
      selected: freezed == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as RelationUserModel?,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as MutualAuthReceiveStage,
    ));
  }

  /// Create a copy of MutualAuthReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationUserModelCopyWith<$Res>? get selected {
    if (_self.selected == null) {
      return null;
    }

    return $RelationUserModelCopyWith<$Res>(_self.selected!, (value) {
      return _then(_self.copyWith(selected: value));
    });
  }
}

// dart format on
