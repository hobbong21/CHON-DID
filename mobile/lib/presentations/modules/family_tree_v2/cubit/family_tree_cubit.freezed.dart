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
  String get errorMessage;
  List<RelationUserModel> get rawList;
  List<FamilyTreeNode> get roots;

  /// Currently selected node id. `null` = nothing selected.
  int? get selectedId;

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
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.rawList, rawList) &&
            const DeepCollectionEquality().equals(other.roots, roots) &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(rawList),
      const DeepCollectionEquality().hash(roots),
      selectedId);

  @override
  String toString() {
    return 'FamilyTreeState(isLoading: $isLoading, errorMessage: $errorMessage, rawList: $rawList, roots: $roots, selectedId: $selectedId)';
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
      String errorMessage,
      List<RelationUserModel> rawList,
      List<FamilyTreeNode> roots,
      int? selectedId});
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
    Object? errorMessage = null,
    Object? rawList = null,
    Object? roots = null,
    Object? selectedId = freezed,
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
      rawList: null == rawList
          ? _self.rawList
          : rawList // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
      roots: null == roots
          ? _self.roots
          : roots // ignore: cast_nullable_to_non_nullable
              as List<FamilyTreeNode>,
      selectedId: freezed == selectedId
          ? _self.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
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
            String errorMessage,
            List<RelationUserModel> rawList,
            List<FamilyTreeNode> roots,
            int? selectedId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.rawList,
            _that.roots, _that.selectedId);
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
            List<RelationUserModel> rawList,
            List<FamilyTreeNode> roots,
            int? selectedId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState():
        return $default(_that.isLoading, _that.errorMessage, _that.rawList,
            _that.roots, _that.selectedId);
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
            List<RelationUserModel> rawList,
            List<FamilyTreeNode> roots,
            int? selectedId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FamilyTreeState() when $default != null:
        return $default(_that.isLoading, _that.errorMessage, _that.rawList,
            _that.roots, _that.selectedId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FamilyTreeState implements FamilyTreeState {
  _FamilyTreeState(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<RelationUserModel> rawList = const [],
      final List<FamilyTreeNode> roots = const [],
      this.selectedId = null})
      : _rawList = rawList,
        _roots = roots;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<RelationUserModel> _rawList;
  @override
  @JsonKey()
  List<RelationUserModel> get rawList {
    if (_rawList is EqualUnmodifiableListView) return _rawList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawList);
  }

  final List<FamilyTreeNode> _roots;
  @override
  @JsonKey()
  List<FamilyTreeNode> get roots {
    if (_roots is EqualUnmodifiableListView) return _roots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roots);
  }

  /// Currently selected node id. `null` = nothing selected.
  @override
  @JsonKey()
  final int? selectedId;

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
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._rawList, _rawList) &&
            const DeepCollectionEquality().equals(other._roots, _roots) &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(_rawList),
      const DeepCollectionEquality().hash(_roots),
      selectedId);

  @override
  String toString() {
    return 'FamilyTreeState(isLoading: $isLoading, errorMessage: $errorMessage, rawList: $rawList, roots: $roots, selectedId: $selectedId)';
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
      String errorMessage,
      List<RelationUserModel> rawList,
      List<FamilyTreeNode> roots,
      int? selectedId});
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
    Object? errorMessage = null,
    Object? rawList = null,
    Object? roots = null,
    Object? selectedId = freezed,
  }) {
    return _then(_FamilyTreeState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      rawList: null == rawList
          ? _self._rawList
          : rawList // ignore: cast_nullable_to_non_nullable
              as List<RelationUserModel>,
      roots: null == roots
          ? _self._roots
          : roots // ignore: cast_nullable_to_non_nullable
              as List<FamilyTreeNode>,
      selectedId: freezed == selectedId
          ? _self.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
