import 'package:e_commercy/features/auth/presentation/views/login_view.dart';
import 'package:e_commercy/features/auth/presentation/views/register_view.dart';
import 'package:e_commercy/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kRegisterView = '/register';
  static const kLoginView = '/login';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kRegisterView, builder: (context, state) => RegisterView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    ],
  );
}
