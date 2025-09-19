import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/common/app/providers/user_provider.dart';
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

    result.fold((failure) => emit(AuthError(failure.message)), (user) {
      UserProvider.instance.setUser(user);
      emit(LoggedIn(user));
    });
  }

  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    emit(AuthLoading());
    final result = await _register(
      RegisterParams(
        name: name,
        password: password,
        email: email,
        phone: phone,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(Registered()),
    );
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());
    final result = await _forgotPassword(email);
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(OTPSent()),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(AuthLoading());
    final result = await _resetPassword(
      ResetPasswordParams(email: email, newPassword: newPassword),
    );
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(PasswordReset()),
    );
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(AuthLoading());

    final result = await _verifyOtp(VerifyOtpParams(email: email, otp: otp));
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(OTPVerified()),
    );
  }

  Future<void> verifyToken() async {
    emit(AuthLoading());
    final result = await _verifyToken();
    result.fold((failure) => emit(AuthError(failure.errorMessage)), (isValid) {
      emit(TokenVerified(isValid));
      if (!isValid) UserProvider.instance.setUser(null);
    });
  }
}
