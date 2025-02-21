import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

final GoRouter appRouter = GoRouter(
  routes: appRoutes,

  // Error builder for handling navigation errors
  errorBuilder:
      (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Navigation Error')),
        body: Center(
          child: Text(
            state.error?.message ?? 'Unknown error',
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      ),

  // redirect: (context, state) {
  //   // Example: if user is not logged in, redirect to login page
  //   final bool isLoggedIn = false; // Replace with actual auth logic
  //   final bool goingToLogin = state.subloc == AppRoutes.login;
  //   if (!isLoggedIn && !goingToLogin) return AppRoutes.login;
  //   return null;
  // },
);
