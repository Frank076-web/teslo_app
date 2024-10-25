import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teslo_app/features/auth/auth.dart';
import 'package:teslo_app/features/shared/shared.dart';

part 'auth_provider_notifier.dart';
part 'auth_provider_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
      repository: authRepository,
      keyValueStorageService: keyValueStorageService);
});
