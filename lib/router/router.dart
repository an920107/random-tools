import 'package:go_router/go_router.dart';
import 'package:random_tools/router/routes.dart';
import 'package:random_tools/view/home_page.dart';
import 'package:random_tools/view/page/lot_page.dart';
import 'package:random_tools/view/page/number_page.dart';

abstract class Router {
  static GoRouter get router => GoRouter(
        initialLocation: Routes.root.path,
        routes: [
          GoRoute(
            path: Routes.root.path,
            builder: (_, __) => const HomePage(),
          ),
          GoRoute(
            path: Routes.number.path,
            builder: (_, __) => const NumberPage(),
          ),
          GoRoute(
            path: Routes.lot.path,
            builder: (_, __) => const LotPage(),
          ),
        ],
      );
}
