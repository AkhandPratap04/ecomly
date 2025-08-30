import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/usecase/usecase.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';
import 'package:prakhya_ecomly/src/auth/domain/repositories/auth_repository.dart';

class VerifyOtp extends UseCaseWithParams<void, VerifyOtpParams> {
  final AuthRepository _repo;

  const VerifyOtp(this._repo);

  @override
  FutureResult<void> call(VerifyOtpParams params) =>
      _repo.verifyOtp(email: params.email, otp: params.otp);
}

class VerifyOtpParams extends Equatable {
  final String email;
  final String otp;

  const VerifyOtpParams({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}
