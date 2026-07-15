import 'package:go_router/go_router.dart';
import 'package:ibank/features/auth/view/forgot_password.dart';
import 'package:ibank/features/auth/view/otp_verification.dart';
import 'package:ibank/features/auth/view/sign_in.dart';
import 'package:ibank/features/auth/view/sign_up.dart';
import 'package:ibank/features/auth/view/success_screen.dart';
import 'package:ibank/features/home/view/home_screen.dart';
import 'package:ibank/features/home/view/screens/account_and_card/account_and_card.dart';
import 'package:ibank/features/home/view/screens/beneficiary.dart';
import 'package:ibank/features/home/view/screens/credit_card.dart';
import 'package:ibank/features/home/view/screens/account_and_card/card_details.dart';
import 'package:ibank/features/home/view/screens/mobile_prepaid/confirm_mobile_prepaid.dart';
import 'package:ibank/features/home/view/screens/common/successful_screen.dart';
import 'package:ibank/features/home/view/screens/mobile_prepaid/mobile_prepaid.dart';
import 'package:ibank/features/home/view/screens/save_online.dart';
import 'package:ibank/features/home/view/screens/pay_bill/pay_bills.dart';
import 'package:ibank/features/home/view/screens/pay_bill/bill_payment_details_screen.dart';
import 'package:ibank/features/home/view/screens/transaction_report.dart';
import 'package:ibank/features/home/view/screens/transfer.dart';
import 'package:ibank/features/home/view/screens/withdraw.dart';
import 'package:ibank/features/notifications/view/notification_screen.dart';
import 'package:ibank/features/search/view/search_screen.dart';
import 'package:ibank/features/search/screens/branch_screen.dart';
import 'package:ibank/features/search/screens/exchange_rate_screen.dart';
import 'package:ibank/features/search/screens/exchange_screen.dart';
import 'package:ibank/features/search/screens/interest_screen.dart';
import 'package:ibank/features/settings/view/settings_screen.dart';
import 'package:ibank/features/splash_screen.dart';

class AppRouter {
  // --- CORE ---
  static const String splash = '/';

  // --- AUTHENTICATION ---
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String successScreen = '/success-screen';

  // --- MAIN SCREENS (BOTTOM NAVIGATION) ---
  static const String homeScreen = '/home-screen';
  static const String searchScreen = '/search-screen';
  static const String notificationScreen = '/notification-screen';
  static const String settingsScreen = '/settings-screen';

  // --- SEARCH SUB-SCREENS ---
  static const String branchScreen = '/search/branch';
  static const String exchangeRateScreen = '/search/exchange-rate';
  static const String exchangeScreen = '/search/exchange';
  static const String interestScreen = '/search/interest-rate';

  // --- HOME FEATURES ---
  static const String transactionReport = '/transaction-report';
  static const String accountAndCard = '/account-and-card';
  static const String transfer = '/transfer';
  static const String withdraw = '/withdraw';
  static const String mobilePrepaid = '/mobile-prepaid';
  static const String payBills = '/pay-bills';
  static const String billDetails =
      '/bill/:billId'; // Dynamic route for bill details
  static const String saveOnline = '/save-online';
  static const String creditCard = '/credit-card';
  static const String beneficiary = '/beneficiary';

  // --- INNER/DETAIL SCREENS ---
  static const String cardDetails = '/card-details';
  static const String successfulScreen = '/success';
  static const String confirmPrepaid = '/confirm-prepaid';

  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      // --- CORE ---
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      // --- AUTHENTICATION ---
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
        name: 'successs',
        builder: (context, state) => const SuccessScreen(),
      ),
      // --- MAIN SCREENS (BOTTOM NAVIGATION) ---
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
      // --- SEARCH SUB-SCREENS ---
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
      // --- HOME FEATURES ---
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
        path: payBills,
        name: 'pay-bills',
        builder: (context, state) => const PayBills(),
      ),
      // --- INNER/DETAIL SCREENS ---
      GoRoute(
        path: successfulScreen,
        name: 'success',
        builder: (context, state) {
          final successfulScreen = state.extra as SuccessfulScreen?;
          return successfulScreen ??
              const SuccessfulScreen(
                text: "Success",
                description: "The operation was successful.",
              );
        },
      ),
      GoRoute(
        path: confirmPrepaid,
        name: 'confirm-prepaid',
        builder: (context, state) => const ConfirmMobilePrepaid(),
      ),
      GoRoute(
        path: cardDetails,
        name: 'card-details',
        builder: (context, state) {
          final cardType = state.extra as String?;
          return CardDetails(cardType: cardType);
        },
      ),
      GoRoute(
        path: billDetails,
        name: 'bill-details',
        builder: (context, state) =>
            BillPaymentDetailsScreen(billId: state.pathParameters['billId']!),
      ),
    ],
  );
}
