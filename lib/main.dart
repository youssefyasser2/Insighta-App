import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insighta/app/myapp.dart';
import 'package:insighta/features/login/data/datasources/login_api.dart';
import 'package:insighta/features/login/data/repositories/login_repository.dart';
import 'package:insighta/features/login/logic/cubit/login_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize API and Repository
  final loginApi = LoginApi();
  final loginRepository = LoginRepository(loginApi: loginApi);

  runApp(
    BlocProvider(
      create: (context) => LoginCubit(repository: loginRepository),
      child: const MyApp(),
    ),
  );
}
