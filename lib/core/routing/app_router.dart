// ignore_for_file: unused_local_variable

import 'package:doctor_reservation_app/core/di/dependency_injection.dart';
import 'package:doctor_reservation_app/core/routing/router.dart';
import 'package:doctor_reservation_app/features/home/ui/home_screen.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/login/ui/login_screen.dart';
import 'package:doctor_reservation_app/features/onboarding/onboarding_screen.dart';
import 'package:doctor_reservation_app/features/signup/logic/signup_cubit.dart';
import 'package:doctor_reservation_app/features/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    // this arguments to be passed in any screen like this ( arguents as ClassName )
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${routeSettings.name}',
              ),
            ),
          ),
        );
    }
  }
}
