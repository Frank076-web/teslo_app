part of 'auth_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.repository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await repository.login(email, password);

      _setLoggedUser(user);
    } on WrongCredentials catch (_) {
      logout('Las credenciales no son correctas');
    } on ConnectionTimeout catch (_) {
      logout('Timeout');
    } catch (_) {
      logout('Error no controlado');
    }
  }

  Future<void> registerUser(String email, String password) async {}

  Future<void> checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');

    if (token == null || token.isEmpty) return logout();

    try {
      final user = await repository.checkAuthStatus(token);
      _setLoggedUser(user);
    } catch (_) {
      logout();
    }
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');

    state = state.copyWith(
      user: null,
      authStatus: AuthStatus.notAuthenticated,
      errorMessage: errorMessage,
    );
  }

  void _setLoggedUser(User user) async {
    await keyValueStorageService.setKeyValue('token', user.token);

    state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }
}
