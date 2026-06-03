import 'package:go_router/go_router.dart';
import 'package:ibank/features/auth/view/forgot_password.dart';
import 'package:ibank/features/auth/view/otp_verification.dart';
import 'package:ibank/features/auth/view/sign_in.dart';
import 'package:ibank/features/auth/view/sign_up.dart';
import 'package:ibank/features/auth/view/success_screen.dart';
import 'package:ibank/features/home/view/home_screen.dart';
import 'package:ibank/features/home/view/screens/account_and_card.dart';
import 'package:ibank/features/home/view/screens/beneficiary.dart';
import 'package:ibank/features/home/view/screens/credit_card.dart';
import 'package:ibank/features/home/view/screens/inner_screens/card_details.dart';
import 'package:ibank/features/home/view/screens/inner_screens/withdraw_success.dart';
import 'package:ibank/features/home/view/screens/mobile_prepaid.dart';
import 'package:ibank/features/home/view/screens/save_online.dart';
import 'package:ibank/features/home/view/screens/transaction_report.dart';
import 'package:ibank/features/home/view/screens/transfer.dart';
import 'package:ibank/features/home/view/screens/withdraw.dart';
import 'package:ibank/features/notifications/view/notification_screen.dart';
import 'package:ibank/features/search/view/search_screen.dart';
import 'package:ibank/features/screens/views/branch_screen.dart';
import 'package:ibank/features/screens/views/exchange_rate_screen.dart';
import 'package:ibank/features/screens/views/exchange_screen.dart';
import 'package:ibank/features/screens/views/interest_screen.dart';
import 'package:ibank/features/settings/view/settings_screen.dart';
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
  static const String searchScreen = '/search-screen';
  static const String notificationScreen = '/notification-screen';
  static const String settingsScreen = '/settings-screen';
  static const String branchScreen = '/search/branch';
  static const String exchangeRateScreen = '/search/exchange-rate';
  static const String exchangeScreen = '/search/exchange';
  static const String interestScreen = '/search/interest-rate';
  static const String transactionReport = '/transaction-report';
  static const String accountAndCard = '/account-and-card';
  static const String transfer = '/transfer';
  static const String withdraw = '/withdraw';
  static const String mobilePrepaid = '/mobile-prepaid';
  static const String payBills = '/pay-bills';
  static const String saveOnline = '/save-online';
  static const String creditCard = '/credit-card';
  static const String beneficiary = '/beneficiary';
  static const String cardDetails = '/card-details';
  static const String withdrawSuccess = '/withdraw-success';

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
      GoRoute(
        path: settingsScreen,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: searchScreen,
        name: 'search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: notificationScreen,
        name: 'notifications',
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: branchScreen,
        name: 'branch',
        builder: (context, state) => const BranchScreen(),
      ),
      GoRoute(
        path: exchangeRateScreen,
        name: 'exchange-rate',
        builder: (context, state) => const ExchangeRateScreen(),
      ),
      GoRoute(
        path: exchangeScreen,
        name: 'exchange',
        builder: (context, state) => const ExchangeScreen(),
      ),
      GoRoute(
        path: interestScreen,
        name: 'interest-rate',
        builder: (context, state) => const InterestScreen(),
      ),
      GoRoute(
        path: transactionReport,
        name: 'transaction-report',
        builder: (context, state) => const TransactionReport(),
      ),
      GoRoute(
        path: creditCard,
        name: 'credit-card',
        builder: (context, state) => const CreditCard(),
      ),
      GoRoute(
        path: beneficiary,
        name: 'beneficiary',
        builder: (context, state) => const Beneficiary(),
      ),
      GoRoute(
        path: mobilePrepaid,
        name: 'mobile-prepaid',
        builder: (context, state) => const MobilePrepaid(),
      ),
      GoRoute(
        path: saveOnline,
        name: 'save-online',
        builder: (context, state) => const SaveOnline(),
      ),
      GoRoute(
        path: transfer,
        name: 'transfer',
        builder: (context, state) => const Transfer(),
      ),
      GoRoute(
        path: withdraw,
        name: 'withdraw',
        builder: (context, state) => const Withdraw(),
      ),
      GoRoute(
        path: accountAndCard,
        name: 'account-and-card',
        builder: (context, state) => const AccountAndCard(),
      ),
      GoRoute(
        path: withdrawSuccess,
        name: 'withdraw-success',
        builder: (context, state) => const WithdrawSuccess(),
      ),
      GoRoute(
        path: cardDetails,
        name: 'card-details',
        builder: (context, state) {
          final cardType = state.extra as String?;
          return CardDetails(cardType: cardType);
        },
      ),
    ],
  );
}
