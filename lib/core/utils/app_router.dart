import 'package:e_commercy/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commercy/features/auth/presentation/views/login_view.dart';
import 'package:e_commercy/features/auth/presentation/views/register_view.dart';
import 'package:e_commercy/features/home/presentation/cubits/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:e_commercy/features/home/presentation/cubits/get_new_arrivals_cubit/get_new_arrivals_cubit.dart';
import 'package:e_commercy/features/home/presentation/views/home_view.dart';
import 'package:e_commercy/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kRegisterView = '/register';
  static const kLoginView = '/login';
  static const kHomeView = '/home';

  static final router = GoRouter(
    initialLocation:
        FirebaseAuth.instance.currentUser != null ? kHomeView : '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(
        path: kRegisterView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child: RegisterView(),
            ),
      ),
      GoRoute(
        path: kLoginView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child: LoginView(),
            ),
      ),
      GoRoute(
        path: kHomeView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => GetAllProductsCubit()),
                BlocProvider(create: (context) => GetNewArrivalsCubit()),
              ],
              child: HomeView(),
            ),
      ),
    ],
  );
}
