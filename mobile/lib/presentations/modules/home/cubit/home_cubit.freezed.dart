// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  bool get isLoading;
  String get messageError;
  List<CardInfoItem> get listCards;
  List<RelationUserModel> get requesterList;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality().equals(other.listCards, listCards) &&
            const DeepCollectionEquality()
                .equals(other.requesterList, requesterList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      messageError,
      const DeepCollectionEquality().hash(listCards),
      const DeepCollectionEquality().hash(requesterList));

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, messageError: $messageError, listCards: $listCards, requesterList: $requesterList)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      List<CardInfoItem> listCards,
      List<RelationUserModel> requesterList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? listCards = null,
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
      listCards: null == listCards
          ? _self.listCards
          : listCards // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
      requesterList: null == requesterList
          ? _self.requesterList
          : requesterList // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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
    TResult Function(_HomeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
    TResult Function(_HomeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
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
    TResult? Function(_HomeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
            String messageError,
            List<CardInfoItem> listCards,
            List<RelationUserModel> requesterList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(_that.isLoading, _that.messageError, _that.listCards,
            _that.requesterList);
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
            List<CardInfoItem> listCards, List<RelationUserModel> requesterList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
        return $default(_that.isLoading, _that.messageError, _that.listCards,
            _that.requesterList);
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
            String messageError,
            List<CardInfoItem> listCards,
            List<RelationUserModel> requesterList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(_that.isLoading, _that.messageError, _that.listCards,
            _that.requesterList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeState implements HomeState {
  _HomeState(
      {this.isLoading = false,
      this.messageError = '',
      final List<CardInfoItem> listCards = const [],
      final List<RelationUserModel> requesterList = const []})
      : _listCards = listCards,
        _requesterList = requesterList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String messageError;
  final List<CardInfoItem> _listCards;
  @override
  @JsonKey()
  List<CardInfoItem> get listCards {
    if (_listCards is EqualUnmodifiableListView) return _listCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCards);
  }

  final List<RelationUserModel> _requesterList;
  @override
  @JsonKey()
  List<RelationUserModel> get requesterList {
    if (_requesterList is EqualUnmodifiableListView) return _requesterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requesterList);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality()
                .equals(other._listCards, _listCards) &&
            const DeepCollectionEquality()
                .equals(other._requesterList, _requesterList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      messageError,
      const DeepCollectionEquality().hash(_listCards),
      const DeepCollectionEquality().hash(_requesterList));

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, messageError: $messageError, listCards: $listCards, requesterList: $requesterList)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      List<CardInfoItem> listCards,
      List<RelationUserModel> requesterList});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? listCards = null,
    Object? requesterList = null,
  }) {
    return _then(_HomeState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      listCards: null == listCards
          ? _self._listCards
          : listCards // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
      requesterList: null == requesterList
          ? _self._requesterList
          : requesterList // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
    ));
  }
}

// dart format on
