import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit() : super(LoginInitial());

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      emit(LoginFailure(errorMessage: 'Email and password cannot be empty.'));
      return;
    }
    emit(LoginLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
