// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/auth/auth_vm.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthViewModel viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel..init(),
      builder: (ctx, _) {
        return viewModel.selector<AuthViewModel, bool>(
          selector: () => viewModel.isAuthorized,
          builder: (ctx, _) {
            return Scaffold(
              backgroundColor: Colors.amber,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _loginWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      _passwordWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buttonWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                     
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _loginWidget() {
    return TextField(
      controller: viewModel.loginController,
      onChanged: viewModel.changeLogin,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'login',
      ),
    );
  }

  Widget _passwordWidget() {
    return TextField(
      controller: viewModel.passwordController,
      onChanged: viewModel.changePassword,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'password',
      ),
    );
  }

  Widget _buttonWidget() {
    return viewModel.selector<AuthViewModel, bool>(
      selector: () => viewModel.canSubmit,
      builder: (ctx, _) {
        return ElevatedButton(
          onPressed: viewModel.canSubmit ? viewModel.tryLogin : null,
          child: const Text('press me'),
        );
      },
    );
  }
}
