// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReportRequest {
  @JsonKey(name: 'fullName')
  String? get fullName;
  @JsonKey(name: 'email')
  String? get email;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'file')
  String? get file;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateReportRequestCopyWith<CreateReportRequest> get copyWith =>
      _$CreateReportRequestCopyWithImpl<CreateReportRequest>(
          this as CreateReportRequest, _$identity);

  /// Serializes this CreateReportRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateReportRequest &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, email, title, content, file);

  @override
  String toString() {
    return 'CreateReportRequest(fullName: $fullName, email: $email, title: $title, content: $content, file: $file)';
  }
}

/// @nodoc
abstract mixin class $CreateReportRequestCopyWith<$Res> {
  factory $CreateReportRequestCopyWith(
          CreateReportRequest value, $Res Function(CreateReportRequest) _then) =
      _$CreateReportRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'fullName') String? fullName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'file') String? file});
}

/// @nodoc
class _$CreateReportRequestCopyWithImpl<$Res>
    implements $CreateReportRequestCopyWith<$Res> {
  _$CreateReportRequestCopyWithImpl(this._self, this._then);

  final CreateReportRequest _self;
  final $Res Function(CreateReportRequest) _then;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? file = freezed,
  }) {
    return _then(_self.copyWith(
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateReportRequest].
extension CreateReportRequestPatterns on CreateReportRequest {
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
    TResult Function(_CreateReportRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
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
    TResult Function(_CreateReportRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest():
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
    TResult? Function(_CreateReportRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
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
            @JsonKey(name: 'fullName') String? fullName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'file') String? file)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
        return $default(_that.fullName, _that.email, _that.title, _that.content,
            _that.file);
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
            @JsonKey(name: 'fullName') String? fullName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'file') String? file)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest():
        return $default(_that.fullName, _that.email, _that.title, _that.content,
            _that.file);
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
            @JsonKey(name: 'fullName') String? fullName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'file') String? file)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateReportRequest() when $default != null:
        return $default(_that.fullName, _that.email, _that.title, _that.content,
            _that.file);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateReportRequest implements CreateReportRequest {
  const _CreateReportRequest(
      {@JsonKey(name: 'fullName') this.fullName,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'file') this.file});
  factory _CreateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestFromJson(json);

  @override
  @JsonKey(name: 'fullName')
  final String? fullName;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'file')
  final String? file;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateReportRequestCopyWith<_CreateReportRequest> get copyWith =>
      __$CreateReportRequestCopyWithImpl<_CreateReportRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateReportRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateReportRequest &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, email, title, content, file);

  @override
  String toString() {
    return 'CreateReportRequest(fullName: $fullName, email: $email, title: $title, content: $content, file: $file)';
  }
}

/// @nodoc
abstract mixin class _$CreateReportRequestCopyWith<$Res>
    implements $CreateReportRequestCopyWith<$Res> {
  factory _$CreateReportRequestCopyWith(_CreateReportRequest value,
          $Res Function(_CreateReportRequest) _then) =
      __$CreateReportRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fullName') String? fullName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'file') String? file});
}

/// @nodoc
class __$CreateReportRequestCopyWithImpl<$Res>
    implements _$CreateReportRequestCopyWith<$Res> {
  __$CreateReportRequestCopyWithImpl(this._self, this._then);

  final _CreateReportRequest _self;
  final $Res Function(_CreateReportRequest) _then;

  /// Create a copy of CreateReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? file = freezed,
  }) {
    return _then(_CreateReportRequest(
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ReportModel {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'fullName')
  String? get fullName;
  @JsonKey(name: 'email')
  String? get email;
  @JsonKey(name: 'title')
  String? get title;
  @JsonKey(name: 'content')
  String? get content;
  @JsonKey(name: 'filePath')
  String? get filePath;
  @JsonKey(
      name: 'createdTime',
      fromJson: ReportModel.dateFromJson,
      toJson: ReportModel.dateToJson)
  String? get createdTime;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportModelCopyWith<ReportModel> get copyWith =>
      _$ReportModelCopyWithImpl<ReportModel>(this as ReportModel, _$identity);

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fullName, email, title, content, filePath, createdTime);

  @override
  String toString() {
    return 'ReportModel(id: $id, fullName: $fullName, email: $email, title: $title, content: $content, filePath: $filePath, createdTime: $createdTime)';
  }
}

/// @nodoc
abstract mixin class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) _then) =
      _$ReportModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'fullName') String? fullName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'filePath') String? filePath,
      @JsonKey(
          name: 'createdTime',
          fromJson: ReportModel.dateFromJson,
          toJson: ReportModel.dateToJson)
      String? createdTime});
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res> implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._self, this._then);

  final ReportModel _self;
  final $Res Function(ReportModel) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? filePath = freezed,
    Object? createdTime = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _self.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportModel].
extension ReportModelPatterns on ReportModel {
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
    TResult Function(_ReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportModel() when $default != null:
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
    TResult Function(_ReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportModel():
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
    TResult? Function(_ReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportModel() when $default != null:
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'fullName') String? fullName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'filePath') String? filePath,
            @JsonKey(
                name: 'createdTime',
                fromJson: ReportModel.dateFromJson,
                toJson: ReportModel.dateToJson)
            String? createdTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportModel() when $default != null:
        return $default(_that.id, _that.fullName, _that.email, _that.title,
            _that.content, _that.filePath, _that.createdTime);
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'fullName') String? fullName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'filePath') String? filePath,
            @JsonKey(
                name: 'createdTime',
                fromJson: ReportModel.dateFromJson,
                toJson: ReportModel.dateToJson)
            String? createdTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportModel():
        return $default(_that.id, _that.fullName, _that.email, _that.title,
            _that.content, _that.filePath, _that.createdTime);
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
            @JsonKey(name: 'id') int? id,
            @JsonKey(name: 'fullName') String? fullName,
            @JsonKey(name: 'email') String? email,
            @JsonKey(name: 'title') String? title,
            @JsonKey(name: 'content') String? content,
            @JsonKey(name: 'filePath') String? filePath,
            @JsonKey(
                name: 'createdTime',
                fromJson: ReportModel.dateFromJson,
                toJson: ReportModel.dateToJson)
            String? createdTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportModel() when $default != null:
        return $default(_that.id, _that.fullName, _that.email, _that.title,
            _that.content, _that.filePath, _that.createdTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReportModel implements ReportModel {
  const _ReportModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'fullName') this.fullName,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'filePath') this.filePath,
      @JsonKey(
          name: 'createdTime',
          fromJson: ReportModel.dateFromJson,
          toJson: ReportModel.dateToJson)
      this.createdTime});
  factory _ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'fullName')
  final String? fullName;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'filePath')
  final String? filePath;
  @override
  @JsonKey(
      name: 'createdTime',
      fromJson: ReportModel.dateFromJson,
      toJson: ReportModel.dateToJson)
  final String? createdTime;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportModelCopyWith<_ReportModel> get copyWith =>
      __$ReportModelCopyWithImpl<_ReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fullName, email, title, content, filePath, createdTime);

  @override
  String toString() {
    return 'ReportModel(id: $id, fullName: $fullName, email: $email, title: $title, content: $content, filePath: $filePath, createdTime: $createdTime)';
  }
}

/// @nodoc
abstract mixin class _$ReportModelCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$ReportModelCopyWith(
          _ReportModel value, $Res Function(_ReportModel) _then) =
      __$ReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'fullName') String? fullName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'filePath') String? filePath,
      @JsonKey(
          name: 'createdTime',
          fromJson: ReportModel.dateFromJson,
          toJson: ReportModel.dateToJson)
      String? createdTime});
}

/// @nodoc
class __$ReportModelCopyWithImpl<$Res> implements _$ReportModelCopyWith<$Res> {
  __$ReportModelCopyWithImpl(this._self, this._then);

  final _ReportModel _self;
  final $Res Function(_ReportModel) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? filePath = freezed,
    Object? createdTime = freezed,
  }) {
    return _then(_ReportModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _self.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
