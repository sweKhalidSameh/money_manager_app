import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';
import 'package:money_manager/core/helper/map_error.dart';
import 'package:money_manager/features/auth/logic/data/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({required this.authRepository}) : super(SignUpInitial());

  Future<void> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password,
      required String confirmPassword}) async {
    emit(SignUpLoading());

    try {
      await authRepository.signUp(
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        email: email.trim(),
        phone: phone.trim(),
        password: password,
      );
      if (isClosed) return;
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (isClosed) return;
      emit(SignUpFailure(errorMessage: mapError(e.code)));
    } catch (_) {
      if (isClosed) return;
      emit(SignUpFailure(
          errorMessage: 'Something went wrong. Please try again.'));
    }
  }
}
