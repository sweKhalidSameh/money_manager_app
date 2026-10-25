import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/core/helper/map_error.dart';
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
      emit(LoginFailure(errorMessage: mapError(e.code)));
    } catch (_) {
      if (isClosed) return;
      emit(LoginFailure(
          errorMessage: 'Something went wrong. Please try again.'));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      bool success = await authRepository.signInWithGoogle();
      if (success) {
        if (isClosed) return;
        emit(LoginSuccess());
      } else {
        if (isClosed) return;
        emit(LoginInitial());
      }
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      emit(LoginFailure(errorMessage: mapError(e.code)));
    } catch (_) {
      if (isClosed) return;
      emit(LoginFailure(
          errorMessage: 'Something went wrong. Please try again.'));
    }
  }
}
