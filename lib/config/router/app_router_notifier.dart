import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/providers/providers.dart';

final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.watch(authProvider.notifier);

  return GoRouterNotifier(authNotifier);
});

class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;

  AuthStatus _authStatus = AuthStatus.checking;

  GoRouterNotifier(AuthNotifier authNotifier) : _authNotifier = authNotifier {
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    if (value == _authStatus) return;

    _authStatus = value;
    notifyListeners();
  }
}
