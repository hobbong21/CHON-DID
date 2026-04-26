// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageRes {
  List<ChoiceModel>? get choices;

  /// Create a copy of MessageRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageResCopyWith<MessageRes> get copyWith =>
      _$MessageResCopyWithImpl<MessageRes>(this as MessageRes, _$identity);

  /// Serializes this MessageRes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageRes &&
            const DeepCollectionEquality().equals(other.choices, choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(choices));

  @override
  String toString() {
    return 'MessageRes(choices: $choices)';
  }
}

/// @nodoc
abstract mixin class $MessageResCopyWith<$Res> {
  factory $MessageResCopyWith(
          MessageRes value, $Res Function(MessageRes) _then) =
      _$MessageResCopyWithImpl;
  @useResult
  $Res call({List<ChoiceModel>? choices});
}

/// @nodoc
class _$MessageResCopyWithImpl<$Res> implements $MessageResCopyWith<$Res> {
  _$MessageResCopyWithImpl(this._self, this._then);

  final MessageRes _self;
  final $Res Function(MessageRes) _then;

  /// Create a copy of MessageRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choices = freezed,
  }) {
    return _then(_self.copyWith(
      choices: freezed == choices
          ? _self.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChoiceModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessageRes].
extension MessageResPatterns on MessageRes {
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
    TResult Function(_MessageRes value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageRes() when $default != null:
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
    TResult Function(_MessageRes value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRes():
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
    TResult? Function(_MessageRes value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRes() when $default != null:
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
    TResult Function(List<ChoiceModel>? choices)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageRes() when $default != null:
        return $default(_that.choices);
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
    TResult Function(List<ChoiceModel>? choices) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRes():
        return $default(_that.choices);
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
    TResult? Function(List<ChoiceModel>? choices)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageRes() when $default != null:
        return $default(_that.choices);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageRes implements MessageRes {
  const _MessageRes({final List<ChoiceModel>? choices}) : _choices = choices;
  factory _MessageRes.fromJson(Map<String, dynamic> json) =>
      _$MessageResFromJson(json);

  final List<ChoiceModel>? _choices;
  @override
  List<ChoiceModel>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MessageRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageResCopyWith<_MessageRes> get copyWith =>
      __$MessageResCopyWithImpl<_MessageRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageResToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageRes &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_choices));

  @override
  String toString() {
    return 'MessageRes(choices: $choices)';
  }
}

/// @nodoc
abstract mixin class _$MessageResCopyWith<$Res>
    implements $MessageResCopyWith<$Res> {
  factory _$MessageResCopyWith(
          _MessageRes value, $Res Function(_MessageRes) _then) =
      __$MessageResCopyWithImpl;
  @override
  @useResult
  $Res call({List<ChoiceModel>? choices});
}

/// @nodoc
class __$MessageResCopyWithImpl<$Res> implements _$MessageResCopyWith<$Res> {
  __$MessageResCopyWithImpl(this._self, this._then);

  final _MessageRes _self;
  final $Res Function(_MessageRes) _then;

  /// Create a copy of MessageRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? choices = freezed,
  }) {
    return _then(_MessageRes(
      choices: freezed == choices
          ? _self._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChoiceModel>?,
    ));
  }
}

/// @nodoc
mixin _$ChoiceModel {
  MsgModel? get message;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChoiceModelCopyWith<ChoiceModel> get copyWith =>
      _$ChoiceModelCopyWithImpl<ChoiceModel>(this as ChoiceModel, _$identity);

  /// Serializes this ChoiceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChoiceModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ChoiceModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ChoiceModelCopyWith<$Res> {
  factory $ChoiceModelCopyWith(
          ChoiceModel value, $Res Function(ChoiceModel) _then) =
      _$ChoiceModelCopyWithImpl;
  @useResult
  $Res call({MsgModel? message});

  $MsgModelCopyWith<$Res>? get message;
}

/// @nodoc
class _$ChoiceModelCopyWithImpl<$Res> implements $ChoiceModelCopyWith<$Res> {
  _$ChoiceModelCopyWithImpl(this._self, this._then);

  final ChoiceModel _self;
  final $Res Function(ChoiceModel) _then;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as MsgModel?,
    ));
  }

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MsgModelCopyWith<$Res>? get message {
    if (_self.message == null) {
      return null;
    }

    return $MsgModelCopyWith<$Res>(_self.message!, (value) {
      return _then(_self.copyWith(message: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChoiceModel].
extension ChoiceModelPatterns on ChoiceModel {
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
    TResult Function(_ChoiceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChoiceModel() when $default != null:
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
    TResult Function(_ChoiceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChoiceModel():
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
    TResult? Function(_ChoiceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChoiceModel() when $default != null:
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
    TResult Function(MsgModel? message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChoiceModel() when $default != null:
        return $default(_that.message);
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
    TResult Function(MsgModel? message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChoiceModel():
        return $default(_that.message);
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
    TResult? Function(MsgModel? message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChoiceModel() when $default != null:
        return $default(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChoiceModel implements ChoiceModel {
  const _ChoiceModel({this.message});
  factory _ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceModelFromJson(json);

  @override
  final MsgModel? message;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChoiceModelCopyWith<_ChoiceModel> get copyWith =>
      __$ChoiceModelCopyWithImpl<_ChoiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChoiceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChoiceModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ChoiceModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ChoiceModelCopyWith<$Res>
    implements $ChoiceModelCopyWith<$Res> {
  factory _$ChoiceModelCopyWith(
          _ChoiceModel value, $Res Function(_ChoiceModel) _then) =
      __$ChoiceModelCopyWithImpl;
  @override
  @useResult
  $Res call({MsgModel? message});

  @override
  $MsgModelCopyWith<$Res>? get message;
}

/// @nodoc
class __$ChoiceModelCopyWithImpl<$Res> implements _$ChoiceModelCopyWith<$Res> {
  __$ChoiceModelCopyWithImpl(this._self, this._then);

  final _ChoiceModel _self;
  final $Res Function(_ChoiceModel) _then;

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ChoiceModel(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as MsgModel?,
    ));
  }

  /// Create a copy of ChoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MsgModelCopyWith<$Res>? get message {
    if (_self.message == null) {
      return null;
    }

    return $MsgModelCopyWith<$Res>(_self.message!, (value) {
      return _then(_self.copyWith(message: value));
    });
  }
}

/// @nodoc
mixin _$MsgModel {
  String? get content;

  /// Create a copy of MsgModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MsgModelCopyWith<MsgModel> get copyWith =>
      _$MsgModelCopyWithImpl<MsgModel>(this as MsgModel, _$identity);

  /// Serializes this MsgModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MsgModel &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  @override
  String toString() {
    return 'MsgModel(content: $content)';
  }
}

/// @nodoc
abstract mixin class $MsgModelCopyWith<$Res> {
  factory $MsgModelCopyWith(MsgModel value, $Res Function(MsgModel) _then) =
      _$MsgModelCopyWithImpl;
  @useResult
  $Res call({String? content});
}

/// @nodoc
class _$MsgModelCopyWithImpl<$Res> implements $MsgModelCopyWith<$Res> {
  _$MsgModelCopyWithImpl(this._self, this._then);

  final MsgModel _self;
  final $Res Function(MsgModel) _then;

  /// Create a copy of MsgModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MsgModel].
extension MsgModelPatterns on MsgModel {
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
    TResult Function(_MsgModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MsgModel() when $default != null:
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
    TResult Function(_MsgModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MsgModel():
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
    TResult? Function(_MsgModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MsgModel() when $default != null:
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
    TResult Function(String? content)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MsgModel() when $default != null:
        return $default(_that.content);
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
    TResult Function(String? content) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MsgModel():
        return $default(_that.content);
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
    TResult? Function(String? content)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MsgModel() when $default != null:
        return $default(_that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MsgModel implements MsgModel {
  const _MsgModel({this.content});
  factory _MsgModel.fromJson(Map<String, dynamic> json) =>
      _$MsgModelFromJson(json);

  @override
  final String? content;

  /// Create a copy of MsgModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MsgModelCopyWith<_MsgModel> get copyWith =>
      __$MsgModelCopyWithImpl<_MsgModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MsgModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MsgModel &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  @override
  String toString() {
    return 'MsgModel(content: $content)';
  }
}

/// @nodoc
abstract mixin class _$MsgModelCopyWith<$Res>
    implements $MsgModelCopyWith<$Res> {
  factory _$MsgModelCopyWith(_MsgModel value, $Res Function(_MsgModel) _then) =
      __$MsgModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? content});
}

/// @nodoc
class __$MsgModelCopyWithImpl<$Res> implements _$MsgModelCopyWith<$Res> {
  __$MsgModelCopyWithImpl(this._self, this._then);

  final _MsgModel _self;
  final $Res Function(_MsgModel) _then;

  /// Create a copy of MsgModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
  }) {
    return _then(_MsgModel(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
