// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'self_id_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelfIdListState {
  bool get isLoading;
  String get errorMessage;
  List<CardInfoItem> get cards;
  int get page;
  bool get isLastPage;
  List<CardInfoItem> get cardsSelected;
  bool get selectMode;

  /// Create a copy of SelfIdListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelfIdListStateCopyWith<SelfIdListState> get copyWith =>
      _$SelfIdListStateCopyWithImpl<SelfIdListState>(
          this as SelfIdListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelfIdListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.cards, cards) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            const DeepCollectionEquality()
                .equals(other.cardsSelected, cardsSelected) &&
            (identical(other.selectMode, selectMode) ||
                other.selectMode == selectMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(cards),
      page,
      isLastPage,
      const DeepCollectionEquality().hash(cardsSelected),
      selectMode);

  @override
  String toString() {
    return 'SelfIdListState(isLoading: $isLoading, errorMessage: $errorMessage, cards: $cards, page: $page, isLastPage: $isLastPage, cardsSelected: $cardsSelected, selectMode: $selectMode)';
  }
}

/// @nodoc
abstract mixin class $SelfIdListStateCopyWith<$Res> {
  factory $SelfIdListStateCopyWith(
          SelfIdListState value, $Res Function(SelfIdListState) _then) =
      _$SelfIdListStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<CardInfoItem> cards,
      int page,
      bool isLastPage,
      List<CardInfoItem> cardsSelected,
      bool selectMode});
}

/// @nodoc
class _$SelfIdListStateCopyWithImpl<$Res>
    implements $SelfIdListStateCopyWith<$Res> {
  _$SelfIdListStateCopyWithImpl(this._self, this._then);

  final SelfIdListState _self;
  final $Res Function(SelfIdListState) _then;

  /// Create a copy of SelfIdListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? cards = null,
    Object? page = null,
    Object? isLastPage = null,
    Object? cardsSelected = null,
    Object? selectMode = null,
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
      cards: null == cards
          ? _self.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _self.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      cardsSelected: null == cardsSelected
          ? _self.cardsSelected
          : cardsSelected // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
      selectMode: null == selectMode
          ? _self.selectMode
          : selectMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SelfIdListState].
extension SelfIdListStatePatterns on SelfIdListState {
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
    TResult Function(_SelfIdListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelfIdListState() when $default != null:
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
    TResult Function(_SelfIdListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdListState():
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
    TResult? Function(_SelfIdListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdListState() when $default != null:
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
            List<CardInfoItem> cards,
            int page,
            bool isLastPage,
            List<CardInfoItem> cardsSelected,
            bool selectMode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelfIdListState() when $default != null:
        return $default(
            _that.isLoading,
            _that.errorMessage,
            _that.cards,
            _that.page,
            _that.isLastPage,
            _that.cardsSelected,
            _that.selectMode);
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
            List<CardInfoItem> cards,
            int page,
            bool isLastPage,
            List<CardInfoItem> cardsSelected,
            bool selectMode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdListState():
        return $default(
            _that.isLoading,
            _that.errorMessage,
            _that.cards,
            _that.page,
            _that.isLastPage,
            _that.cardsSelected,
            _that.selectMode);
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
            List<CardInfoItem> cards,
            int page,
            bool isLastPage,
            List<CardInfoItem> cardsSelected,
            bool selectMode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelfIdListState() when $default != null:
        return $default(
            _that.isLoading,
            _that.errorMessage,
            _that.cards,
            _that.page,
            _that.isLastPage,
            _that.cardsSelected,
            _that.selectMode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SelfIdListState implements SelfIdListState {
  const _SelfIdListState(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<CardInfoItem> cards = const [],
      this.page = 0,
      this.isLastPage = false,
      final List<CardInfoItem> cardsSelected = const [],
      this.selectMode = false})
      : _cards = cards,
        _cardsSelected = cardsSelected;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<CardInfoItem> _cards;
  @override
  @JsonKey()
  List<CardInfoItem> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isLastPage;
  final List<CardInfoItem> _cardsSelected;
  @override
  @JsonKey()
  List<CardInfoItem> get cardsSelected {
    if (_cardsSelected is EqualUnmodifiableListView) return _cardsSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardsSelected);
  }

  @override
  @JsonKey()
  final bool selectMode;

  /// Create a copy of SelfIdListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelfIdListStateCopyWith<_SelfIdListState> get copyWith =>
      __$SelfIdListStateCopyWithImpl<_SelfIdListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelfIdListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            const DeepCollectionEquality()
                .equals(other._cardsSelected, _cardsSelected) &&
            (identical(other.selectMode, selectMode) ||
                other.selectMode == selectMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(_cards),
      page,
      isLastPage,
      const DeepCollectionEquality().hash(_cardsSelected),
      selectMode);

  @override
  String toString() {
    return 'SelfIdListState(isLoading: $isLoading, errorMessage: $errorMessage, cards: $cards, page: $page, isLastPage: $isLastPage, cardsSelected: $cardsSelected, selectMode: $selectMode)';
  }
}

/// @nodoc
abstract mixin class _$SelfIdListStateCopyWith<$Res>
    implements $SelfIdListStateCopyWith<$Res> {
  factory _$SelfIdListStateCopyWith(
          _SelfIdListState value, $Res Function(_SelfIdListState) _then) =
      __$SelfIdListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<CardInfoItem> cards,
      int page,
      bool isLastPage,
      List<CardInfoItem> cardsSelected,
      bool selectMode});
}

/// @nodoc
class __$SelfIdListStateCopyWithImpl<$Res>
    implements _$SelfIdListStateCopyWith<$Res> {
  __$SelfIdListStateCopyWithImpl(this._self, this._then);

  final _SelfIdListState _self;
  final $Res Function(_SelfIdListState) _then;

  /// Create a copy of SelfIdListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? cards = null,
    Object? page = null,
    Object? isLastPage = null,
    Object? cardsSelected = null,
    Object? selectMode = null,
  }) {
    return _then(_SelfIdListState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _self._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _self.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      cardsSelected: null == cardsSelected
          ? _self._cardsSelected
          : cardsSelected // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
      selectMode: null == selectMode
          ? _self.selectMode
          : selectMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
