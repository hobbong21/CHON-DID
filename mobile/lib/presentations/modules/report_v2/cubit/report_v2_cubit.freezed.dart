// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_v2_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportV2State {
  ReportV2Stage get stage;
  bool get isLoading;
  String get errorMessage;
  List<ReportModel> get reports; // compose form fields
  String get fullName;
  String get email;
  String get title;
  String get content;
  String? get attachmentBase64;

  /// Create a copy of ReportV2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportV2StateCopyWith<ReportV2State> get copyWith =>
      _$ReportV2StateCopyWithImpl<ReportV2State>(
          this as ReportV2State, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportV2State &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.reports, reports) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.attachmentBase64, attachmentBase64) ||
                other.attachmentBase64 == attachmentBase64));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stage,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(reports),
      fullName,
      email,
      title,
      content,
      attachmentBase64);

  @override
  String toString() {
    return 'ReportV2State(stage: $stage, isLoading: $isLoading, errorMessage: $errorMessage, reports: $reports, fullName: $fullName, email: $email, title: $title, content: $content, attachmentBase64: $attachmentBase64)';
  }
}

/// @nodoc
abstract mixin class $ReportV2StateCopyWith<$Res> {
  factory $ReportV2StateCopyWith(
          ReportV2State value, $Res Function(ReportV2State) _then) =
      _$ReportV2StateCopyWithImpl;
  @useResult
  $Res call(
      {ReportV2Stage stage,
      bool isLoading,
      String errorMessage,
      List<ReportModel> reports,
      String fullName,
      String email,
      String title,
      String content,
      String? attachmentBase64});
}

/// @nodoc
class _$ReportV2StateCopyWithImpl<$Res>
    implements $ReportV2StateCopyWith<$Res> {
  _$ReportV2StateCopyWithImpl(this._self, this._then);

  final ReportV2State _self;
  final $Res Function(ReportV2State) _then;

  /// Create a copy of ReportV2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? reports = null,
    Object? fullName = null,
    Object? email = null,
    Object? title = null,
    Object? content = null,
    Object? attachmentBase64 = freezed,
  }) {
    return _then(_self.copyWith(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ReportV2Stage,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      reports: null == reports
          ? _self.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportModel>,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentBase64: freezed == attachmentBase64
          ? _self.attachmentBase64
          : attachmentBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportV2State].
extension ReportV2StatePatterns on ReportV2State {
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
    TResult Function(_ReportV2State value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportV2State() when $default != null:
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
    TResult Function(_ReportV2State value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportV2State():
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
    TResult? Function(_ReportV2State value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportV2State() when $default != null:
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
            ReportV2Stage stage,
            bool isLoading,
            String errorMessage,
            List<ReportModel> reports,
            String fullName,
            String email,
            String title,
            String content,
            String? attachmentBase64)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportV2State() when $default != null:
        return $default(
            _that.stage,
            _that.isLoading,
            _that.errorMessage,
            _that.reports,
            _that.fullName,
            _that.email,
            _that.title,
            _that.content,
            _that.attachmentBase64);
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
            ReportV2Stage stage,
            bool isLoading,
            String errorMessage,
            List<ReportModel> reports,
            String fullName,
            String email,
            String title,
            String content,
            String? attachmentBase64)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportV2State():
        return $default(
            _that.stage,
            _that.isLoading,
            _that.errorMessage,
            _that.reports,
            _that.fullName,
            _that.email,
            _that.title,
            _that.content,
            _that.attachmentBase64);
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
            ReportV2Stage stage,
            bool isLoading,
            String errorMessage,
            List<ReportModel> reports,
            String fullName,
            String email,
            String title,
            String content,
            String? attachmentBase64)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportV2State() when $default != null:
        return $default(
            _that.stage,
            _that.isLoading,
            _that.errorMessage,
            _that.reports,
            _that.fullName,
            _that.email,
            _that.title,
            _that.content,
            _that.attachmentBase64);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportV2State implements ReportV2State {
  _ReportV2State(
      {this.stage = ReportV2Stage.list,
      this.isLoading = false,
      this.errorMessage = '',
      final List<ReportModel> reports = const [],
      this.fullName = '',
      this.email = '',
      this.title = '',
      this.content = '',
      this.attachmentBase64 = null})
      : _reports = reports;

  @override
  @JsonKey()
  final ReportV2Stage stage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<ReportModel> _reports;
  @override
  @JsonKey()
  List<ReportModel> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

// compose form fields
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String? attachmentBase64;

  /// Create a copy of ReportV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportV2StateCopyWith<_ReportV2State> get copyWith =>
      __$ReportV2StateCopyWithImpl<_ReportV2State>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportV2State &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.attachmentBase64, attachmentBase64) ||
                other.attachmentBase64 == attachmentBase64));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stage,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(_reports),
      fullName,
      email,
      title,
      content,
      attachmentBase64);

  @override
  String toString() {
    return 'ReportV2State(stage: $stage, isLoading: $isLoading, errorMessage: $errorMessage, reports: $reports, fullName: $fullName, email: $email, title: $title, content: $content, attachmentBase64: $attachmentBase64)';
  }
}

/// @nodoc
abstract mixin class _$ReportV2StateCopyWith<$Res>
    implements $ReportV2StateCopyWith<$Res> {
  factory _$ReportV2StateCopyWith(
          _ReportV2State value, $Res Function(_ReportV2State) _then) =
      __$ReportV2StateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ReportV2Stage stage,
      bool isLoading,
      String errorMessage,
      List<ReportModel> reports,
      String fullName,
      String email,
      String title,
      String content,
      String? attachmentBase64});
}

/// @nodoc
class __$ReportV2StateCopyWithImpl<$Res>
    implements _$ReportV2StateCopyWith<$Res> {
  __$ReportV2StateCopyWithImpl(this._self, this._then);

  final _ReportV2State _self;
  final $Res Function(_ReportV2State) _then;

  /// Create a copy of ReportV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stage = null,
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? reports = null,
    Object? fullName = null,
    Object? email = null,
    Object? title = null,
    Object? content = null,
    Object? attachmentBase64 = freezed,
  }) {
    return _then(_ReportV2State(
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ReportV2Stage,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      reports: null == reports
          ? _self._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportModel>,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentBase64: freezed == attachmentBase64
          ? _self.attachmentBase64
          : attachmentBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
