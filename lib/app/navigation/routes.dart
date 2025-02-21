import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insighta/features/forgetpassword/presentation/screens/forget_password.dart';
import 'package:insighta/features/home/presentation/screens/home_screen.dart';
import 'package:insighta/features/login/presentation/screens/login_screen.dart';
import 'package:insighta/features/onboarding/logic/cubit/onboarding_cubit.dart';
import 'package:insighta/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:insighta/features/signup/presentation/screens/register_screen.dart';

/// Centralized route names for the app
class AppRoutes {
  static const String onboarding = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forgetPassword';
}

/// List of routes used in the app
final List<GoRoute> appRoutes = [
  // Onboarding route
  GoRoute(
    path: AppRoutes.onboarding,
    builder:
        (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(totalPages: 3),
          child: const OnboardingScreen(),
        ),
  ),

  // Home route
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) => const HomeScreen(),
  ),

  // Login route
  GoRoute(
    path: AppRoutes.login,
    builder: (context, state) => LoginScreen(),
  ),

  // Signup route
  GoRoute(
    path: AppRoutes.signup,
    builder: (context, state) => SignupScreen(),
  ),
  // Forgot Password route
  GoRoute(
    path: AppRoutes.forgetPassword,
    builder: (context, state) => ForgetPasswordScreen(),
  ),
];
