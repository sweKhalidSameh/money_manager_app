import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/features/auth/logic/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit({required this.authRepository}) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await authRepository.signIn(email: email.trim(), password: password);
      if (isClosed) return;
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      emit(LoginFailure(errorMessage: _mapError(e.code)));
    } catch (_) {
      if (isClosed) return;
      emit(LoginFailure(
          errorMessage: 'Something went wrong. Please try again.'));
    }
  }

  String _mapError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Login failed. Please try again.';
    }
  }
}
