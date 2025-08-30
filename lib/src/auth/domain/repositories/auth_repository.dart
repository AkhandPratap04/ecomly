import 'package:prakhya_ecomly/core/common/entities/user.dart';
import 'package:prakhya_ecomly/core/utils/typedefs.dart';

abstract class AuthRepository {
  FutureResult<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  });

  FutureResult<User> login({required String email, required String password});

  FutureResult<void> forgotPassword({required String email});


  FutureResult<void> verifyOtp ({required String email, required String otp});

  FutureResult<void> resetPassword({
    required String email,
    required String newPassword,
  });

  FutureResult<bool> verifyToken();
}
