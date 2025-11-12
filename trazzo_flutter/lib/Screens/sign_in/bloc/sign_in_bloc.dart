import 'package:trazzo_flutter/Screens/sign_in/bloc/sign_in_event.dart';
import 'package:trazzo_flutter/Screens/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailChanged>((event, emit) {
      final newEmail = event.email;
      emit(
        state.copyWith(
          email: newEmail, 
          isValid: _validate(newEmail, state.password)
          )
        );
    });

    on<PasswordChanged>((event, emit) {
      final newPassword = event.password;
      emit(
        state.copyWith(
          password: newPassword,
          isValid: _validate(state.email, newPassword)
        )
      );
    });
  }

  bool _validate(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
  
