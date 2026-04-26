// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_tree_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FamilyTreeState {
  bool get isLoading;
  String get messageError;
  List<RelationUserModel> get relationUser;
  List<RelationModel> get relationTypeList;
  CardInfoItem? get card;
  PersonNode? get rootNode;

  /// Create a copy of FamilyTreeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FamilyTreeStateCopyWith<FamilyTreeState> get copyWith =>
      _$FamilyTreeStateCopyWithImpl<FamilyTreeState>(
          this as FamilyTreeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FamilyTreeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality()
                .equals(other.relationUser, relationUser) &&
            const DeepCollectionEquality()
                .equals(other.relationTypeList, relationTypeList) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.rootNode, rootNode) ||
                other.rootNode == rootNode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      messageError,
      const DeepCollectionEquality().hash(relationUser),
      const DeepCollectionEquality().hash(relationTypeList),
      card,
      rootNode);

  @override
  String toString() {
    return 'FamilyTreeState(isLoading: $isLoading, messageError: $messageError, relationUser: $relationUser, relationTypeList: $relationTypeList, card: $card, rootNode: $rootNode)';
  }
}

/// @nodoc
abstract mixin class $FamilyTreeStateCopyWith<$Res> {
  factory $FamilyTreeStateCopyWith(
          FamilyTreeState value, $Res Function(FamilyTreeState) _then) =
      _$FamilyTreeStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      List<RelationUserModel> relationUser,
      List<RelationModel> relationTypeList,
      CardInfoItem? card,
      PersonNode? rootNode});

  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class _$FamilyTreeStateCopyWithImpl<$Res>
    implements $FamilyTreeStateCopyWith<$Res> {
  _$FamilyTreeStateCopyWithImpl(this._self, this._then);

  final FamilyTreeState _self;
  final $Res Function(FamilyTreeState) _then;

  /// Create a copy of FamilyTreeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? relationUser = null,
    Object? relationTypeList = null,
    Object? card = freezed,
    Object? rootNode = freezed,
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
      relationUser: null == relationUser
          ? _self.relationUser
          : relationUser // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
      relationTypeList: null == relationTypeList
          ? _self.relationTypeList
          : relationTypeList // ignore: cast_nullable_to_non_nullable
              as List<RelationModel>,
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      rootNode: freezed == rootNode
          ? _self.rootNode
          : rootNode // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
    ));
  }

  /// Create a copy of FamilyTreeState
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

/// Adds pattern-matching-related methods to [FamilyTreeState].
extension FamilyTreeStatePatterns on FamilyTreeState {
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
    TResult Function(_FamilyTreeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState() when $default != null:
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
    TResult Function(_FamilyTreeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState():
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
    TResult? Function(_FamilyTreeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState() when $default != null:
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
            List<RelationUserModel> relationUser,
            List<RelationModel> relationTypeList,
            CardInfoItem? card,
            PersonNode? rootNode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState() when $default != null:
        return $default(_that.isLoading, _that.messageError, _that.relationUser,
            _that.relationTypeList, _that.card, _that.rootNode);
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
            String messageError,
            List<RelationUserModel> relationUser,
            List<RelationModel> relationTypeList,
            CardInfoItem? card,
            PersonNode? rootNode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState():
        return $default(_that.isLoading, _that.messageError, _that.relationUser,
            _that.relationTypeList, _that.card, _that.rootNode);
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
            List<RelationUserModel> relationUser,
            List<RelationModel> relationTypeList,
            CardInfoItem? card,
            PersonNode? rootNode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState() when $default != null:
        return $default(_that.isLoading, _that.messageError, _that.relationUser,
            _that.relationTypeList, _that.card, _that.rootNode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FamilyTreeState implements FamilyTreeState {
  _FamilyTreeState(
      {this.isLoading = false,
      this.messageError = '',
      final List<RelationUserModel> relationUser = const [],
      final List<RelationModel> relationTypeList = const [],
      this.card,
      this.rootNode})
      : _relationUser = relationUser,
        _relationTypeList = relationTypeList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String messageError;
  final List<RelationUserModel> _relationUser;
  @override
  @JsonKey()
  List<RelationUserModel> get relationUser {
    if (_relationUser is EqualUnmodifiableListView) return _relationUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relationUser);
  }

  final List<RelationModel> _relationTypeList;
  @override
  @JsonKey()
  List<RelationModel> get relationTypeList {
    if (_relationTypeList is EqualUnmodifiableListView)
      return _relationTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relationTypeList);
  }

  @override
  final CardInfoItem? card;
  @override
  final PersonNode? rootNode;

  /// Create a copy of FamilyTreeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FamilyTreeStateCopyWith<_FamilyTreeState> get copyWith =>
      __$FamilyTreeStateCopyWithImpl<_FamilyTreeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FamilyTreeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            const DeepCollectionEquality()
                .equals(other._relationUser, _relationUser) &&
            const DeepCollectionEquality()
                .equals(other._relationTypeList, _relationTypeList) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.rootNode, rootNode) ||
                other.rootNode == rootNode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      messageError,
      const DeepCollectionEquality().hash(_relationUser),
      const DeepCollectionEquality().hash(_relationTypeList),
      card,
      rootNode);

  @override
  String toString() {
    return 'FamilyTreeState(isLoading: $isLoading, messageError: $messageError, relationUser: $relationUser, relationTypeList: $relationTypeList, card: $card, rootNode: $rootNode)';
  }
}

/// @nodoc
abstract mixin class _$FamilyTreeStateCopyWith<$Res>
    implements $FamilyTreeStateCopyWith<$Res> {
  factory _$FamilyTreeStateCopyWith(
          _FamilyTreeState value, $Res Function(_FamilyTreeState) _then) =
      __$FamilyTreeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String messageError,
      List<RelationUserModel> relationUser,
      List<RelationModel> relationTypeList,
      CardInfoItem? card,
      PersonNode? rootNode});

  @override
  $CardInfoItemCopyWith<$Res>? get card;
}

/// @nodoc
class __$FamilyTreeStateCopyWithImpl<$Res>
    implements _$FamilyTreeStateCopyWith<$Res> {
  __$FamilyTreeStateCopyWithImpl(this._self, this._then);

  final _FamilyTreeState _self;
  final $Res Function(_FamilyTreeState) _then;

  /// Create a copy of FamilyTreeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? messageError = null,
    Object? relationUser = null,
    Object? relationTypeList = null,
    Object? card = freezed,
    Object? rootNode = freezed,
  }) {
    return _then(_FamilyTreeState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: null == messageError
          ? _self.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String,
      relationUser: null == relationUser
          ? _self._relationUser
          : relationUser // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
      relationTypeList: null == relationTypeList
          ? _self._relationTypeList
          : relationTypeList // ignore: cast_nullable_to_non_nullable
              as List<RelationModel>,
      card: freezed == card
          ? _self.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardInfoItem?,
      rootNode: freezed == rootNode
          ? _self.rootNode
          : rootNode // ignore: cast_nullable_to_non_nullable
              as PersonNode?,
    ));
  }

  /// Create a copy of FamilyTreeState
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
