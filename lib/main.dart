import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reco_genie_intern_task/core/di/di.dart';
import 'package:reco_genie_intern_task/core/routing/app_router.dart';
import 'package:reco_genie_intern_task/core/routing/app_routes.dart';
import 'package:reco_genie_intern_task/core/theme/app_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.register,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
    );
  }
}
