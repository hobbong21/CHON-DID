import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:base_flutter/app/app_cubit.dart';
import 'package:base_flutter/configs.dart';
import 'package:base_flutter/core/di.dart';
import 'package:base_flutter/core/storage/app_shared_preferences.dart';
import 'package:base_flutter/core/utils/log.dart';
import 'package:base_flutter/core/utils/utils.dart';
import 'package:base_flutter/data/data_source/remote/error_mapping.dart';
import 'package:base_flutter/domain/repositories/auth_repo.dart';
import 'package:base_flutter/flavors.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/injector.dart';
import 'package:base_flutter/router/app_navigator.dart';
import 'package:base_flutter/utils/app_utils.dart';
import 'package:flutter/foundation.dart';

class DioInjection {
  DioInjection._();

  static void init() {
    _initDio();
  }

  static const kUnauth = 'kUnauth';

  static void _initDio() {
    Di.getIt.registerLazySingleton<Dio>(
      () {
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: F.baseUrl,
            sendTimeout: Duration(seconds: Configs.timeout),
            receiveTimeout: Duration(seconds: Configs.timeout),
            connectTimeout: Duration(seconds: Configs.timeout),
            headers: {
              'Content-Type': 'application/json',
              'Accept-Language': 'vi',
            },
          ),
        );

        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: handleRequest,
            onResponse: handleResponse,
            onError: handleError,
          ),
        );

        return dio;
      },
    );
  }

  static void handleRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["Accept-Language"] =
        AppSP.get(AppSP.languageLocale) ?? 'en';

    options.responseType = ResponseType.json;

    final isAuth = options.headers[kUnauth] == null;

    if (isAuth) {
      final loginModel = Injector.getIt<AppCubit>().state.loginModel;

      final token = loginModel?.accessToken ?? '';

      if (!Utils.isNullOrEmpty(token) &&
          options.headers['Authorization'] == null) {
        options.headers['Authorization'] = "Bearer $token";
      }
    }

    if (options.data is FormData) {
      options.contentType = Headers.multipartFormDataContentType;
    }

    logRequest(options);

    return handler.next(options);
  }

  static void handleResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logResponse(response);

    if (response.data is Map<String, dynamic>) {
      if (response.data['errorDesc'] != null) {
        handler.reject(
          ResponseException(
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
        return;
      } else if (response.data['data'] != null) {
        final Response res = Response(
          data: response.data['data'],
          requestOptions: RequestOptions(),
        );
        handler.next(res);
        return;
      }
    }

    return handler.next(response);
  }

  static void handleError(
      DioException e, ErrorInterceptorHandler handler) async {
    if (e.response != null) {
      logResponse(e.response!);
    }

    switch (e.type) {
      case DioExceptionType.connectionError:
        handler.next(ConnectException(e.requestOptions));
        return;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        handler.next(TimeoutException(e.requestOptions));
        return;
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 401:
            final isAuth = e.requestOptions.headers[kUnauth] == null;
            if (isAuth) {
              bool isSuccess = await refreshToken();
              if (isSuccess) {
                return handler.resolve(
                    await Injector.getIt<Dio>().fetch(e.requestOptions));
              }
            }
            Injector.getIt<AppCubit>().logout(clearAuth: true);
            final exception = UnauthorizedException(
              requestOptions: e.requestOptions,
              response: e.response,
            );
            handler.next(exception);
            // AppUtils.showSnackBarError(
            //     context: AppNavigator.context, title: exception.toString());
            return;
          case 403:
            handler.next(
              ForbiddenException(
                requestOptions: e.requestOptions,
                response: e.response,
              ),
            );
            return;
          case 400:
          case 404:
          case 409:
          case 500:
          case 502:
          default:
            handler.next(
              ResponseException(
                requestOptions: e.requestOptions,
                response: e.response,
              ),
            );
            return;
        }
      case DioExceptionType.cancel:
        handler.next(
          CancelException(
            requestOptions: e.requestOptions,
            response: e.response,
          ),
        );
        return;
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        break;
    }

    return handler.next(e);
  }

  static Future<bool>? _refreshingTokenFuture;

  static Future<bool> refreshToken() async {
    final loginModel = Injector.getIt<AppCubit>().state.loginModel;

    final refreshToken = loginModel?.refreshToken ?? '';

    if (refreshToken.isEmpty) {
      return false;
    }
    final completer = Completer<bool>();
    try {
      if (_refreshingTokenFuture != null) {
        return _refreshingTokenFuture!;
      }
      _refreshingTokenFuture = completer.future;
      final dataRefresh = await Injector.getIt<AuthRepo>()
          .refreshToken(refreshToken: refreshToken);
      await Injector.getIt<AppCubit>().setLoginModel(dataRefresh);
      completer.complete(true);
      return true;
    } catch (e) {
      completer.complete(false);
      return false;
    }
  }
}

class ConnectException extends DioException {
  ConnectException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return S.current.connectionError;
  }
}

class TimeoutException extends DioException {
  TimeoutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return S.current.connectionInterrupted;
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException({
    required super.requestOptions,
    super.response,
  });

  @override
  String toString() {
    return S.current.loginSessionExpired;
  }
}

class ForbiddenException extends DioException {
  ForbiddenException({
    required super.requestOptions,
    super.response,
  });

  @override
  String toString() {
    return S.current.serviceInterruption;
  }
}

class CancelException extends DioException {
  CancelException({
    required super.requestOptions,
    super.response,
  });

  @override
  String toString() {
    return '';
  }
}

class ResponseException extends DioException {
  ResponseException({
    required super.requestOptions,
    super.response,
  });

  @override
  String toString() {
    final data = response?.data;
    if (data is Map &&
        data['errorCode'] != null &&
        data['errorCode'] is String) {
      final error = ErrorMapping.mapError[data['errorCode']];
      if (error != null) {
        return error;
      }
    }
    if (kDebugMode && data is Map && data['errorDesc'] != null) {
      return data['errorDesc'];
    }
    return S.current.serviceInterruption;
  }
}

void logRequest(RequestOptions options) {
  Log.i('### Request Log ###');
  Log.i('URL: ${options.uri}');
  Log.i('Method: ${options.method}');
  Log.i('Headers: ${options.headers}');
  if (options.data is! FormData) {
    Log.i('Request: ${jsonEncode(options.data)}');
  }
  Log.i('### End Request Log ###');
}

void logResponse(Response response) {
  Log.i('### Response Log ###');
  Log.i('Status Code: ${response.statusCode}');
  Log.i('Status Message: ${response.statusMessage}');
  Log.i('Response: ${jsonEncode(response.data)}');
  Log.i('### End Response Log ###');
}
