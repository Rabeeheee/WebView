import 'package:bw_task_bloc/bloc/auth/auth_bloc.dart';
import 'package:bw_task_bloc/bloc/auth/auth_event.dart';
import 'package:bw_task_bloc/bloc/auth/auth_state.dart';
import 'package:bw_task_bloc/bloc/otp/otp_bloc.dart';
import 'package:bw_task_bloc/bloc/phone/phone_bloc.dart';
import 'package:bw_task_bloc/bloc/webview/webview_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/firebase_auth_repository.dart';
import 'screens/phone_screen.dart';
import 'screens/webview_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FirebaseAuthRepository>(
          create: (context) => FirebaseAuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<FirebaseAuthRepository>(),
            )..add(AuthCheckRequested()),
          ),
          BlocProvider<PhoneBloc>(
            create: (context) => PhoneBloc(
              authRepository: context.read<FirebaseAuthRepository>(),
            ),
          ),
          BlocProvider<OtpBloc>(
            create: (context) => OtpBloc(
              authRepository: context.read<FirebaseAuthRepository>(),
              authBloc: context.read<AuthBloc>(),
            ),
          ),
          BlocProvider<WebViewBloc>(
            create: (context) => WebViewBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Phone Auth App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                return const WebViewScreen();
              }
              return const PhoneScreen();
            },
          ),
        ),
      ),
    );
  }
}