import 'package:prakhya_ecomly/core/usecase/usecase.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';

class VerifyToken extends UseCaseWithoutParams<bool> {
  final AuthRepository _repo;
  const VerifyToken(this._repo);

  @override
  FutureResult<bool> call() => _repo.verifyToken();
}
