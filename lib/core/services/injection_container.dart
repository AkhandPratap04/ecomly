import 'package:get_it/get_it.dart';
import 'package:prakhya_ecomly/core/common/app/cache_helper.dart';
import 'package:prakhya_ecomly/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:prakhya_ecomly/src/auth/data/repositories/auth_repository_implementation.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/forgot_password.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/login.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/register.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/reset_password.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/verify_otp.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/verify_token.dart';
import 'package:prakhya_ecomly/src/auth/presentation/app/adapter/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
part 'injection_container_main.dart';

