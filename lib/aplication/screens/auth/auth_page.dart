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
                      _errorTitleWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      _loginWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      _passwordWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buttonWidget(),
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
          onPressed: viewModel.canSubmit ? viewModel.onAuthButtonPress : null,
          child: const Text('press me'),
        );
      },
    );
  }

  Widget _errorTitleWidget() {
    return viewModel.selector<AuthViewModel, String>(
      selector: () => viewModel.authErrorTittle,
      builder: (ctx, _) {
        return Text(
          viewModel.authErrorTittle,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
