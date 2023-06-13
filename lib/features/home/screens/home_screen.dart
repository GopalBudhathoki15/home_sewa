import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_sewa/core/common/loader.dart';
import 'package:home_sewa/features/auth/controller/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void signOut(WidgetRef ref) {
    ref.watch(authControllerProvider.notifier).logOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.grey,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          title: const Text("Hello User !"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Log out!"),
                ),
              )
            ],
          ),
        ),
        body: isLoading
            ? const Loader()
            : const Center(
                child: Text("Log out"),
              ),
      ),
    );
  }
}
