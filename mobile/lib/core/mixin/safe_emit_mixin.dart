import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SafeEmitMixin<T> on BlocBase<T> {
  @protected
  @override
  void emit(state) {
    if (!isClosed) super.emit(state);
  }
}
