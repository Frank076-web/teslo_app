import 'package:formz/formz.dart';
import 'package:teslo_app/features/auth/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/shared/shared.dart';

part 'login_form_state.dart';
part 'login_form_notifier.dart';

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  final loginUser = ref.watch(authProvider.notifier).loginUser;

  return LoginFormNotifier(loginUser: loginUser);
});
