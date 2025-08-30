import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/usecase/usecase.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';

class ResetPassword extends UseCaseWithParams<void, ResetPasswordParams> {
  final AuthRepository _repo;

  const ResetPassword(this._repo);

  @override
  FutureResult<void> call(ResetPasswordParams params) =>
      _repo.resetPassword(email: params.email, newPassword: params.newPassword);
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordParams({required this.email, required this.newPassword});

  @override
  List<Object?> get props => [email, newPassword];

}
