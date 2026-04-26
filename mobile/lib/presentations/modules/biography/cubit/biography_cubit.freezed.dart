// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biography_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BiographyState {
  bool get isLoading;
  String get messageError;
  BioProfile? get profile;
  List<BioEvent> get events;

  /// Create a copy of BiographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BiographyStateCopyWith<BiographyState> get copyWith =>
      _$BiographyStateCopyWithImpl<BiographyState>(
          this as BiographyState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BiographyState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, messageError, profile,
      const DeepCollectionEquality().hash(events));

  @override
  String toString() {
    return 'BiographyState(isLoading: $isLoading, messageError: $messageError, profile: $profile, events: $events)';
  }
}

/// @nodoc
abstract mixin class $BiographyStateCopyWith<$Res> {
  factory $BiographyStateCopyWith(
          BiographyState value, $Res Function(BiographyState) _then) =
      _$BiographyStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      BioProfile? profile,
      List<BioEvent> events});
}

/// @nodoc
class _$BiographyStateCopyWithImpl<$Res>
    implements $BiographyStateCopyWith<$Res> {
  _$BiographyStateCopyWithImpl(this._self, this._then);

  final BiographyState _self;
  final $Res Function(BiographyState) _then;

  /// Create a copy of BiographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? profile = freezed,
    Object? events = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as BioProfile?,
      events: null == events
          ? _self.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<BioEvent>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BiographyState].
extension BiographyStatePatterns on BiographyState {
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
    TResult Function(_BiographyState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BiographyState() when $default != null:
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
    TResult Function(_BiographyState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiographyState():
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
    TResult? Function(_BiographyState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiographyState() when $default != null:
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
    TResult Function(bool isLoading, String messageError, BioProfile? profile,
            List<BioEvent> events)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BiographyState() when $default != null:
        return $default(
            _that.isLoading, _that.messageError, _that.profile, _that.events);
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
    TResult Function(bool isLoading, String messageError, BioProfile? profile,
            List<BioEvent> events)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiographyState():
        return $default(
            _that.isLoading, _that.messageError, _that.profile, _that.events);
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
    TResult? Function(bool isLoading, String messageError, BioProfile? profile,
            List<BioEvent> events)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiographyState() when $default != null:
        return $default(
            _that.isLoading, _that.messageError, _that.profile, _that.events);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BiographyState implements BiographyState {
  const _BiographyState(
      {this.isLoading = false,
      this.messageError = '',
      this.profile,
      final List<BioEvent> events = const []})
      : _events = events;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String messageError;
  @override
  final BioProfile? profile;
  final List<BioEvent> _events;
  @override
  @JsonKey()
  List<BioEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  /// Create a copy of BiographyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BiographyStateCopyWith<_BiographyState> get copyWith =>
      __$BiographyStateCopyWithImpl<_BiographyState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BiographyState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, messageError, profile,
      const DeepCollectionEquality().hash(_events));

  @override
  String toString() {
    return 'BiographyState(isLoading: $isLoading, messageError: $messageError, profile: $profile, events: $events)';
  }
}

/// @nodoc
abstract mixin class _$BiographyStateCopyWith<$Res>
    implements $BiographyStateCopyWith<$Res> {
  factory _$BiographyStateCopyWith(
          _BiographyState value, $Res Function(_BiographyState) _then) =
      __$BiographyStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      BioProfile? profile,
      List<BioEvent> events});
}

/// @nodoc
class __$BiographyStateCopyWithImpl<$Res>
    implements _$BiographyStateCopyWith<$Res> {
  __$BiographyStateCopyWithImpl(this._self, this._then);

  final _BiographyState _self;
  final $Res Function(_BiographyState) _then;

  /// Create a copy of BiographyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? profile = freezed,
    Object? events = null,
  }) {
    return _then(_BiographyState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as BioProfile?,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<BioEvent>,
    ));
  }
}

// dart format on
