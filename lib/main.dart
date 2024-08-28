
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/get_products_cubit.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/pages/home_view.dart';
import 'package:store_app/pages/get_started_log_sign_view.dart';
import 'package:store_app/pages/get_started_view.dart';
import 'package:store_app/pages/login_view.dart';
import 'package:store_app/pages/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetProductsCubit()),
      ],
      child: const StoreApp(),
    ),
  );
}
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GetStartedLogSignView.id : (context) => const GetStartedLogSignView(),
        LoginView.id : (context) => const LoginView(),
        SignUpView.id : (context) => const SignUpView(),
        HomeView.id : (context) => const HomeView(),
        GetStartedView.id : (context) => const GetStartedView()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: GetStartedView.id,
    );
  }
}