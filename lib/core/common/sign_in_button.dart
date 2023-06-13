import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_sewa/core/common/loader.dart';

import '../../features/auth/controller/auth_controller.dart';
import '../constants/constants.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? const Loader()
        : Padding(
            padding: const EdgeInsets.all(18),
            child: ElevatedButton.icon(
              onPressed: () {
                signInWithGoogle(context, ref);
              },
              icon: Image.asset(
                Constants.googlePath,
                width: 35,
              ),
              label: const Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  // backgroundColor: Pallete.greyColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            ),
          );
  }
}
