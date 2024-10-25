part of './login_form_provider.dart';

typedef LoginUserFn = Future<void> Function(String, String);

//!  2 - Como implementamos un StateNotifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final LoginUserFn loginUser;

  LoginFormNotifier({required this.loginUser}) : super(LoginFormState());

  void onEmailChange(String value) {
    final newEmail = Email.dirty(value);

    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  void onPasswordChange(String value) {
    final newPassword = Password.dirty(value);

    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    );
  }

  void onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);
    await loginUser(state.email.value, state.password.value);
    state = state.copyWith(isPosting: false);
  }

  void _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
    );
  }
}
