import 'package:prakhya_ecomly/core/usecase/usecase.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';

class ForgotPassword extends UseCaseWithParams<void, String> {
  final AuthRepository _repo;
  ForgotPassword(this._repo);
  
  @override
  FutureResult<void> call(String params) => _repo.forgotPassword(email: params);
}
