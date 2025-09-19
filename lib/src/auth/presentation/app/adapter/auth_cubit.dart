import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/common/entities/user.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/forgot_password.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/login.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/register.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/reset_password.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/verify_otp.dart';
import 'package:prakhya_ecomly/src/auth/domain/usecases/verify_token.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required ForgotPassword forgotPassword,
    required Login login,
    required Register register,
    required ResetPassword resetPassword,
    required VerifyOtp verifyOtp,
    required VerifyToken verifyToken,
  }) : _forgotPassword = forgotPassword,
       _login = login,
       _register = register,
       _resetPassword = resetPassword,
       _verifyOtp = verifyOtp,
       _verifyToken = verifyToken,
       super(AuthInitial());

  final ForgotPassword _forgotPassword;
  final Login _login;
  final Register _register;
  final ResetPassword _resetPassword;
  final VerifyOtp _verifyOtp;
  final VerifyToken _verifyToken;

  Future<void> login({required email, required password}) async {
    emit(AuthLoading());
    final result = await _login(LoginParams(email: email, password: password));

    result.fold(
      (failer) => emit(AuthError(failer.message)),
      (user) => emit(LoggedIn(user)),
    );
  }
}
