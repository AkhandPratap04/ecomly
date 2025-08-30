import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/common/entities/user.dart';
import 'package:prakhya_ecomly/core/usecase/usecase.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';

class Login extends UseCaseWithParams<User, LoginParams> {
  const Login(this._repo);
  final AuthRepository _repo;
  @override
  FutureResult<User> call(LoginParams params) =>
      _repo.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});
  const LoginParams.empty() : email = "Test String", password = "TestString";

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
