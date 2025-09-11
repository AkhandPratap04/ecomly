// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prakhya_ecomly/core/common/app/cache_helper.dart';
import 'package:prakhya_ecomly/core/common/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:prakhya_ecomly/core/common/singletons/cache.dart';
import 'package:prakhya_ecomly/core/errors/exceptions.dart';
import 'package:prakhya_ecomly/core/extensions/string_extensions.dart';
import 'package:prakhya_ecomly/core/services/injection_container.dart';
import 'package:prakhya_ecomly/core/utils/constants/network_constants.dart';
import 'package:prakhya_ecomly/core/utils/constants/string_constants.dart';
import 'package:prakhya_ecomly/core/utils/error_response.dart';
import 'package:prakhya_ecomly/core/utils/network_utils.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  });

  Future<UserModel> login({required String email, required String password});

  Future<void> forgotPassword({required String email});

  Future<void> verifyOtp({required String email, required String otp});

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  });

  Future<bool> verifyToken();
}

const REGISTER_ENDPOINT = "/register";
const LOGIN_ENDPOINT = "/login";
const FORGOT_PASSWORD_ENDPOINT = "/forgot-password";
const RESET_PASSWORD_ENDPOINT = "/verify-otp";
const VERIFY_OTP_ENDPOINT = "/reset-password";
const VERIFY_TOKEN_ENDPOINT = "/verify-token";

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImplementation(this._client);

  final http.Client _client;

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      final uri = Uri.parse(
        '${NetworkConstants.apiUrl}$FORGOT_PASSWORD_ENDPOINT',
      );

      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email}),
        headers: NetworkConstants.headers,
      );

      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          statusCode: response.statusCode,
          message: errorResponse.errorMessage,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error Occurred: It's not your fault, it's ours",
      );
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('${NetworkConstants.apiUrl}$LOGIN_ENDPOINT');

    try {
      final response = await _client.post(
        uri,
        headers: NetworkConstants.headers,
        body: jsonEncode({"email": email, "password": password}),
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          statusCode: response.statusCode,
          message: errorResponse.errorMessage,
        );
      }
      await sl<CacheHelper>().cacheSessionToken(payload['accessToken']);
      final user = UserModel.fromMap(payload);
      await sl<CacheHelper>().cacheUserId(user.id);
      return user;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        statusCode: 500,
        message: "Error occurred: It's not your fault, it's ours.",
      );
    }
  }

  @override
  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final uri = Uri.parse('${NetworkConstants.apiUrl}$REGISTER_ENDPOINT}');
      final response = await _client.post(
        uri,
        body: jsonEncode({
          "name": name,
          "password": password,
          "email": email,
          "phone": phone,
        }),
        headers: NetworkConstants.headers,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          statusCode: response.statusCode,
          message: errorResponse.errorMessage,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(
        statusCode: 500,
        message: StringConstants.serverFault,
      );
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final uri = Uri.parse(
        "${NetworkConstants.apiUrl}$RESET_PASSWORD_ENDPOINT",
      );
      final response = await _client.post(
        uri,
        body: jsonEncode({"email": email, "newPassword": newPassword}),
        headers: NetworkConstants.headers,
      );

      if (response.statusCode != 200) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          statusCode: response.statusCode,
          message: errorResponse.errorMessage,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(
        statusCode: 500,
        message: StringConstants.serverFault,
      );
    }
  }

  @override
  Future<void> verifyOtp({required String email, required String otp}) async {
    try {
      final uri = Uri.parse("${NetworkConstants.apiUrl}$VERIFY_OTP_ENDPOINT");
      final response = await _client.post(
        uri,
        body: jsonEncode({"email": email, "otp": otp}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          statusCode: response.statusCode,
          message: errorResponse.errorMessage,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(
        statusCode: 500,
        message: StringConstants.serverFault,
      );
    }
  }

  @override
  Future<bool> verifyToken() async {
    try {
      final uri = Uri.parse("${NetworkConstants.apiUrl}$VERIFY_TOKEN_ENDPOINT");
      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeaders,
      );
      final payload = jsonDecode(response.body);
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200) {
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          statusCode: response.statusCode,
          message: errorResponse.errorMessage,
        );
      }
      return payload as bool;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(
        statusCode: 500,
        message: StringConstants.serverFault,
      );
    }
  }
}
