import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';

import '../../../../core/usecase/usecase.dart';

class Register extends UseCaseWithParams<void, RegisterParams> {
  final AuthRepository _repo;

  const Register(this._repo);

  @override
  FutureResult<void> call(RegisterParams params) => _repo.register(
    name: params.name,
    password: params.password,
    email: params.email,
    phone: params.phone,
  );
}

class RegisterParams extends Equatable {
  final String name;
  final String password;
  final String email;
  final String phone;

  const RegisterParams({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });

  @override
  List<dynamic> get props => [name, password, email, phone];
}
