
import 'package:daily_quote/views/home_view.dart';
import 'package:daily_quote/views/main_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kHomeView = '/homeView';

  

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainView()),
    
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    
    ],
  );
}