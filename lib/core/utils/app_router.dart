import 'package:e_commercy/features/auth/presentation/views/register_view.dart';
import 'package:e_commercy/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kRegisterView = '/register';
  static final router = GoRouter(
    routes: [
      GoRoute(path: kRegisterView, builder: (context, state) => RegisterView()),
      GoRoute(path: '/', builder: (context, state) => SplashView()),
    ],
  );
}
