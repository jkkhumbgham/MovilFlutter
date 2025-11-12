class SignInState {
  final String email;
  final String password;
  final bool isValid;

  SignInState({
    this.email = '',
    this.password = '',
    this.isValid = false,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isValid,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}