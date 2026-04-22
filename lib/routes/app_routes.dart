import 'package:go_router/go_router.dart';
import 'package:ibank/features/auth/view/forgot_password.dart';
import 'package:ibank/features/auth/view/otp_verification.dart';
import 'package:ibank/features/auth/view/sign_in.dart';
import 'package:ibank/features/auth/view/sign_up.dart';
import 'package:ibank/features/auth/view/success_screen.dart';
import 'package:ibank/features/home/view/home_screen.dart';
import 'package:ibank/features/splash_screen.dart';

class AppRouter {
  // String constants to prevent typos across the app
  static const String splash = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String successScreen = '/success-screen';
  static const String homeScreen = '/home-screen';

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
      GoRoute(
        path: otpVerification,
        name: 'otp',
        builder: (context, state) => const OtpVerification(),
      ),
      GoRoute(
        path: successScreen,
        name: 'success',
        builder: (context, state) => const SuccessScreen(),
      ),
      GoRoute(
        path: homeScreen,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
