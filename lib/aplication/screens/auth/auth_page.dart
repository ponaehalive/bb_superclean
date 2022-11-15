// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/auth/auth_vm.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/ui/themes/text_styles.dart';
//import 'package:superclean/aplication/widgets/custom_image/custom_image.dart';

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
                      TextButton(
                        onPressed: () => viewModel.setLocale(context),
                        child: Text('change_language'.tr()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //google sign in/out part

                      /*   viewModel.selector<AuthViewModel, bool?>(
                        selector: () =>
                            viewModel.googleCurrentUser?.isAnonymous,
                        builder: (ctx, _) {
                          return viewModel.googleCurrentUser != null
                              ? TextButton(
                                  onPressed: viewModel.googleLogOut,
                                  child: const Text('Log out'),
                                )
                              : TextButton(
                                  onPressed: viewModel.googleSignIn,
                                  child: const Text('Log in'),
                                );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: viewModel.selector<AuthViewModel, bool?>(
                          selector: () =>
                              viewModel.googleCurrentUser?.isAnonymous,
                          builder: (ctx, _) {
                            return CustomImage(
                              viewModel.googleCurrentUser?.photoURL,
                              height: double.infinity,
                              width: double.infinity,
                            );
                          },
                        ),
                      ), */
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
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'user_name'.tr(),
      ),
    );
  }

  Widget _passwordWidget() {
    return TextField(
      controller: viewModel.passwordController,
      onChanged: viewModel.changePassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'password'.tr(),
      ),
    );
  }

  Widget _buttonWidget() {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: viewModel.selector<AuthViewModel, bool>(
        selector: () => viewModel.canSubmit,
        builder: (ctx, _) {
          return ElevatedButton(
            onPressed: viewModel.canSubmit ? viewModel.tryLogin : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              disabledBackgroundColor: AppColors.blue.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'login'.tr().toUpperCase(),
              style: TextStyles.buttonLabelStyle,
            ),
          );
        },
      ),
    );
  }
}
