// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankState {
  bool get isLoading;
  String get errorMessage;
  List<BankModel> get banks;
  List<BankInfoModel> get bankInfo;
  List<CardInfoItem> get listCards;

  /// Create a copy of BankState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankStateCopyWith<BankState> get copyWith =>
      _$BankStateCopyWithImpl<BankState>(this as BankState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.banks, banks) &&
            const DeepCollectionEquality().equals(other.bankInfo, bankInfo) &&
            const DeepCollectionEquality().equals(other.listCards, listCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(banks),
      const DeepCollectionEquality().hash(bankInfo),
      const DeepCollectionEquality().hash(listCards));

  @override
  String toString() {
    return 'BankState(isLoading: $isLoading, errorMessage: $errorMessage, banks: $banks, bankInfo: $bankInfo, listCards: $listCards)';
  }
}

/// @nodoc
abstract mixin class $BankStateCopyWith<$Res> {
  factory $BankStateCopyWith(BankState value, $Res Function(BankState) _then) =
      _$BankStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<BankModel> banks,
      List<BankInfoModel> bankInfo,
      List<CardInfoItem> listCards});
}

/// @nodoc
class _$BankStateCopyWithImpl<$Res> implements $BankStateCopyWith<$Res> {
  _$BankStateCopyWithImpl(this._self, this._then);

  final BankState _self;
  final $Res Function(BankState) _then;

  /// Create a copy of BankState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? banks = null,
    Object? bankInfo = null,
    Object? listCards = null,
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
      banks: null == banks
          ? _self.banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
      bankInfo: null == bankInfo
          ? _self.bankInfo
          : bankInfo // ignore: cast_nullable_to_non_nullable
              as List<BankInfoModel>,
      listCards: null == listCards
          ? _self.listCards
          : listCards // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BankState].
extension BankStatePatterns on BankState {
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
    TResult Function(_BankState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankState() when $default != null:
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
    TResult Function(_BankState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankState():
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
    TResult? Function(_BankState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankState() when $default != null:
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
    TResult Function(bool isLoading, String errorMessage, List<BankModel> banks,
            List<BankInfoModel> bankInfo, List<CardInfoItem> listCards)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.banks,
            _that.bankInfo, _that.listCards);
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
    TResult Function(bool isLoading, String errorMessage, List<BankModel> banks,
            List<BankInfoModel> bankInfo, List<CardInfoItem> listCards)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankState():
        return $default(_that.isLoading, _that.errorMessage, _that.banks,
            _that.bankInfo, _that.listCards);
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
            List<BankModel> banks,
            List<BankInfoModel> bankInfo,
            List<CardInfoItem> listCards)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.banks,
            _that.bankInfo, _that.listCards);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BankState implements BankState {
  const _BankState(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<BankModel> banks = const [],
      final List<BankInfoModel> bankInfo = const [],
      final List<CardInfoItem> listCards = const []})
      : _banks = banks,
        _bankInfo = bankInfo,
        _listCards = listCards;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<BankModel> _banks;
  @override
  @JsonKey()
  List<BankModel> get banks {
    if (_banks is EqualUnmodifiableListView) return _banks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banks);
  }

  final List<BankInfoModel> _bankInfo;
  @override
  @JsonKey()
  List<BankInfoModel> get bankInfo {
    if (_bankInfo is EqualUnmodifiableListView) return _bankInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankInfo);
  }

  final List<CardInfoItem> _listCards;
  @override
  @JsonKey()
  List<CardInfoItem> get listCards {
    if (_listCards is EqualUnmodifiableListView) return _listCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCards);
  }

  /// Create a copy of BankState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankStateCopyWith<_BankState> get copyWith =>
      __$BankStateCopyWithImpl<_BankState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._banks, _banks) &&
            const DeepCollectionEquality().equals(other._bankInfo, _bankInfo) &&
            const DeepCollectionEquality()
                .equals(other._listCards, _listCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(_banks),
      const DeepCollectionEquality().hash(_bankInfo),
      const DeepCollectionEquality().hash(_listCards));

  @override
  String toString() {
    return 'BankState(isLoading: $isLoading, errorMessage: $errorMessage, banks: $banks, bankInfo: $bankInfo, listCards: $listCards)';
  }
}

/// @nodoc
abstract mixin class _$BankStateCopyWith<$Res>
    implements $BankStateCopyWith<$Res> {
  factory _$BankStateCopyWith(
          _BankState value, $Res Function(_BankState) _then) =
      __$BankStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<BankModel> banks,
      List<BankInfoModel> bankInfo,
      List<CardInfoItem> listCards});
}

/// @nodoc
class __$BankStateCopyWithImpl<$Res> implements _$BankStateCopyWith<$Res> {
  __$BankStateCopyWithImpl(this._self, this._then);

  final _BankState _self;
  final $Res Function(_BankState) _then;

  /// Create a copy of BankState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? banks = null,
    Object? bankInfo = null,
    Object? listCards = null,
  }) {
    return _then(_BankState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      banks: null == banks
          ? _self._banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
      bankInfo: null == bankInfo
          ? _self._bankInfo
          : bankInfo // ignore: cast_nullable_to_non_nullable
              as List<BankInfoModel>,
      listCards: null == listCards
          ? _self._listCards
          : listCards // ignore: cast_nullable_to_non_nullable
              as List<CardInfoItem>,
    ));
  }
}

// dart format on
