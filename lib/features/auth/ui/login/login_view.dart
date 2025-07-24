import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/core/extensions/validations_ex.dart';
import 'package:reco_genie_intern_task/features/auth/ui/login/view_model/login_cubit.dart';
import 'package:reco_genie_intern_task/features/auth/ui/login/view_model/login_state.dart';

import '../../../../core/apis/api_error/api_error_handler.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_dialogs.dart';
import '../../data/models/auth_request.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  LoginCubit loginCubit = getIt<LoginCubit>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: BlocProvider(
              create: (context) => loginCubit,
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  switch (state.status) {
                    case LoginStatus.initial:
                      break;
                    case LoginStatus.loading:
                      AppDialogs.displayDialog(
                        title: Center(child: const CircularProgressIndicator()),
                        context: context,
                      );
                    case LoginStatus.success:
                      AppDialogs.hideDialog(context);
                      AppDialogs.showSnackBar(
                        context,
                        'login successful',
                        backgroundColor: Colors.green,
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.home);

                    case LoginStatus.error:
                      AppDialogs.hideDialog(context);
                      AppDialogs.showSnackBar(
                        context,
                        getIt<ApiErrorHandler>().getMessage(state.loginError),
                        backgroundColor: AppColors.red,
                      );
                  }
                },
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login to your\naccount',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Please sign in to your account',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Email Address',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: AppColors.black),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFieldSubmitted:
                              (val) => passwordFocusNode.requestFocus(),
                          validator: (value) {
                            return value.isValidEmail();
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Email',
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: AppColors.black),
                        ),
                        SizedBox(height: 8),

                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          onFieldSubmitted:
                              (val) => passwordFocusNode.unfocus(),
                          validator: (value) {
                            return value.isValidPassword();
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Password',
                          ),
                        ),
                        SizedBox(height: 48),
                        FilledButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            loginCubit.doIntent(
                              OnLoginButtonClicked(
                                AuthRequest(
                                  password: passwordController.text,
                                  email: emailController.text,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account ? ",
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(color: AppColors.black),
                              ),
                              WidgetSpan(
                                baseline: TextBaseline.alphabetic,
                                alignment: PlaceholderAlignment.baseline,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.register,
                                    );
                                  },
                                  child: Text(
                                    'Register',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(color: AppColors.primary),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
