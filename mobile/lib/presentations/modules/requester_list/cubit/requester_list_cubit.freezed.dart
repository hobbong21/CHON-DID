// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requester_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequesterListState {
  bool get isLoading;
  String get messageError;
  List<RelationUserModel> get requesterList;

  /// Create a copy of RequesterListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequesterListStateCopyWith<RequesterListState> get copyWith =>
      _$RequesterListStateCopyWithImpl<RequesterListState>(
          this as RequesterListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequesterListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality()
                .equals(other.requesterList, requesterList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, messageError,
      const DeepCollectionEquality().hash(requesterList));

  @override
  String toString() {
    return 'RequesterListState(isLoading: $isLoading, messageError: $messageError, requesterList: $requesterList)';
  }
}

/// @nodoc
abstract mixin class $RequesterListStateCopyWith<$Res> {
  factory $RequesterListStateCopyWith(
          RequesterListState value, $Res Function(RequesterListState) _then) =
      _$RequesterListStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      List<RelationUserModel> requesterList});
}

/// @nodoc
class _$RequesterListStateCopyWithImpl<$Res>
    implements $RequesterListStateCopyWith<$Res> {
  _$RequesterListStateCopyWithImpl(this._self, this._then);

  final RequesterListState _self;
  final $Res Function(RequesterListState) _then;

  /// Create a copy of RequesterListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? requesterList = null,
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
      requesterList: null == requesterList
          ? _self.requesterList
          : requesterList // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [RequesterListState].
extension RequesterListStatePatterns on RequesterListState {
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
    TResult Function(_RequesterListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RequesterListState() when $default != null:
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
    TResult Function(_RequesterListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequesterListState():
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
    TResult? Function(_RequesterListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequesterListState() when $default != null:
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
    TResult Function(bool isLoading, String messageError,
            List<RelationUserModel> requesterList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RequesterListState() when $default != null:
        return $default(
            _that.isLoading, _that.messageError, _that.requesterList);
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
    TResult Function(bool isLoading, String messageError,
            List<RelationUserModel> requesterList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequesterListState():
        return $default(
            _that.isLoading, _that.messageError, _that.requesterList);
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
    TResult? Function(bool isLoading, String messageError,
            List<RelationUserModel> requesterList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequesterListState() when $default != null:
        return $default(
            _that.isLoading, _that.messageError, _that.requesterList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RequesterListState implements RequesterListState {
  _RequesterListState(
      {this.isLoading = false,
      this.messageError = '',
      final List<RelationUserModel> requesterList = const []})
      : _requesterList = requesterList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String messageError;
  final List<RelationUserModel> _requesterList;
  @override
  @JsonKey()
  List<RelationUserModel> get requesterList {
    if (_requesterList is EqualUnmodifiableListView) return _requesterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requesterList);
  }

  /// Create a copy of RequesterListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequesterListStateCopyWith<_RequesterListState> get copyWith =>
      __$RequesterListStateCopyWithImpl<_RequesterListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequesterListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality()
                .equals(other._requesterList, _requesterList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, messageError,
      const DeepCollectionEquality().hash(_requesterList));

  @override
  String toString() {
    return 'RequesterListState(isLoading: $isLoading, messageError: $messageError, requesterList: $requesterList)';
  }
}

/// @nodoc
abstract mixin class _$RequesterListStateCopyWith<$Res>
    implements $RequesterListStateCopyWith<$Res> {
  factory _$RequesterListStateCopyWith(
          _RequesterListState value, $Res Function(_RequesterListState) _then) =
      __$RequesterListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      List<RelationUserModel> requesterList});
}

/// @nodoc
class __$RequesterListStateCopyWithImpl<$Res>
    implements _$RequesterListStateCopyWith<$Res> {
  __$RequesterListStateCopyWithImpl(this._self, this._then);

  final _RequesterListState _self;
  final $Res Function(_RequesterListState) _then;

  /// Create a copy of RequesterListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? requesterList = null,
  }) {
    return _then(_RequesterListState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      requesterList: null == requesterList
          ? _self._requesterList
          : requesterList // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
    ));
  }
}

// dart format on
