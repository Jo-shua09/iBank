import 'package:go_router/go_router.dart';
import 'package:ibank/features/auth/view/forgot_password.dart';
import 'package:ibank/features/auth/view/sign_in.dart';
import 'package:ibank/features/auth/view/sign_up.dart';
import 'package:ibank/features/splash_screen.dart';

class AppRouter {
  // String constants to prevent typos across the app
  static const String splash = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';

  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: signIn,
        name: 'signin',
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: signUp,
        name: 'signup',
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: forgotPassword,
        name: 'forgotpassword',
        builder: (context, state) => const ForgotPassword(),
      ),
    ],
  );
}
