// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/auth/auth_vm.dart';
import 'package:superclean/aplication/screens/auth/widgets/custom_textfield_widget.dart';
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
              resizeToAvoidBottomInset: false,
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login_background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
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
                          height: 30,
                        ),
                        _buttonWidget(),

                        const SizedBox(
                          height: 100,
                        ),
                        ElevatedButton(
                          onPressed: () => viewModel.goHome(),
                          child: Text(
                            'enter_like_guest'.tr().toUpperCase(),
                            style: TextStyles.labelStyle.copyWith(
                              color: AppColors.darkSecondary,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 150,
                        ),
                        TextButton(
                          onPressed: () => viewModel.setLocale(context),
                          child: Text(
                            'change_language'.tr(),
                            style: TextStyles.labelStyle,
                          ),
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
              ),
            );
          },
        );
      },
    );
  }

  Widget _loginWidget() {
    return CustomTextField(
      controller: viewModel.loginController,
      onChanged: viewModel.changeLogin,
      obscureText: false,
    );
  }

  Widget _passwordWidget() {
    return viewModel.selector<AuthViewModel, bool?>(
      selector: () => viewModel.hidePassword,
      builder: (ctx, _) {
        return viewModel.selector<AuthViewModel, bool?>(
          selector: () => viewModel.isEyeIconActive,
          builder: (ctx, _) {
            return CustomTextField(
              controller: viewModel.passwordController,
              onChanged: viewModel.changePassword,
              obscureText: viewModel.hidePassword,
              icon: viewModel.isEyeIconActive
                  ? IconButton(
                      onPressed: viewModel.onEyeTap,
                      icon: viewModel.hidePassword
                          ? const Icon(
                              Icons.visibility_off,
                              color: AppColors.white,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: AppColors.white,
                            ),
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: AppColors.white.withOpacity(0.2),
                    ),
            );
          },
        );
      },
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
              backgroundColor: AppColors.button,
              disabledBackgroundColor: AppColors.button.withOpacity(0.5),
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
