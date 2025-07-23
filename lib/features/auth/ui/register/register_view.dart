import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/core/apis/api_error/api_error_handler.dart';
import 'package:reco_genie_intern_task/core/colors/app_colors.dart';
import 'package:reco_genie_intern_task/core/di/di.dart';
import 'package:reco_genie_intern_task/core/extensions/validations_ex.dart';
import 'package:reco_genie_intern_task/core/utils/app_dialogs.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';
import 'package:reco_genie_intern_task/features/auth/ui/register/view_model/register_cubit.dart';

import '../../../../core/routing/app_routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  RegisterCubit registerCubit = getIt<RegisterCubit>();

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
              create: (context) => registerCubit,
              child: BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  switch (state.status) {
                    case RegisterStatus.initial:
                      break;
                    case RegisterStatus.loading:
                      AppDialogs.displayDialog(
                        title: Center(child: const CircularProgressIndicator()),
                        context: context,
                      );
                    case RegisterStatus.success:
                      AppDialogs.hideDialog(context);
                      AppDialogs.showSnackBar(
                        context,
                        'Registration successful, please login to continue',
                        backgroundColor: Colors.green,
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.login);

                    case RegisterStatus.error:
                      AppDialogs.hideDialog(context);
                      AppDialogs.showSnackBar(
                        context,
                        getIt<ApiErrorHandler>().getMessage(
                          state.registerError,
                        ),
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
                          'Create your new\naccount',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Create an account to start looking for the food you like',
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
                            registerCubit.doIntent(
                              OnRegisterButtonClicked(
                                AuthRequest(
                                  password: passwordController.text,
                                  email: emailController.text,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
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
                                      AppRoutes.login,
                                    );
                                  },
                                  child: Text(
                                    'Login',
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
