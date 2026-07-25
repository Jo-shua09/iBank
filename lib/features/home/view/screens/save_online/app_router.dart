import 'package:go_router/go_router.dart';
import 'package:ibank/features/home/view/screens/save_online/add_screen.dart';
import 'package:ibank/features/home/view/screens/save_online/choose_card_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/add', builder: (context, state) => const AddScreen()),
      GoRoute(
        path: '/choose-card',
        builder: (context, state) => const ChooseCardScreen(),
      ),
    ],
    initialLocation: '/add',
  );
}
