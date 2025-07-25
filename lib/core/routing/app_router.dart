import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/core/di/di.dart';
import 'package:reco_genie_intern_task/core/routing/app_routes.dart';
import 'package:reco_genie_intern_task/features/auth/ui/login/login_view.dart';
import 'package:reco_genie_intern_task/features/auth/ui/register/register_view.dart';
import 'package:reco_genie_intern_task/features/home/home_view.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/ui/view_model/cart_cubit.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    var name = routeSettings.name;
    try {
      switch (name) {
        case AppRoutes.register:
          return MaterialPageRoute(builder: (context) => const RegisterView());
        case AppRoutes.login:
          return MaterialPageRoute(builder: (context) => const LoginView());
        case AppRoutes.home:
          return MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create: (context) => getIt<CartCubit>(),
                  child: HomeView(),
                ),
          );
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Material(
          child: Container(
            color: Colors.red,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
