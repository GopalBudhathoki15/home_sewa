import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils.dart';
import '../../../../models/user_model.dart';
import '../repository/auth_repository.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final result = await _authRepository.signInWithGoogle();
    state = false;
    result.fold(
      (failure) => showSnackBar(context, failure.message),
      (userModel) => _ref.watch(userProvider.notifier).update((state) => userModel),
    );
  }

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Stream<UserModel> getUserDate(String uid) {
    return _authRepository.getUserDate(uid);
  }

  void logOut() async {
    state = true;
    _authRepository.logOut();
    state = false;
  }
}

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(authRepository: ref.watch(authRepositoryProvider), ref: ref));

final authStateChangeProvider = StreamProvider((ref) {
  return ref.watch(authControllerProvider.notifier).authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  return ref.watch(authControllerProvider.notifier).getUserDate(uid);
});
