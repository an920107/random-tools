import 'package:flutter/material.dart' hide Router;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:random_tools/router/router.dart';
import 'package:random_tools/view_modle/lot_page_view_model.dart';
import 'package:random_tools/view_modle/main_view_model.dart';
import 'package:random_tools/view_modle/number_page_view_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Go_Router 8.0.0 migration
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => MainViewModel()),
        ChangeNotifierProvider(create: (_) => NumberPageViewModel()),
        ChangeNotifierProvider(create: (_) => LotPageViewModel()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            breakpoints: const [
              Breakpoint(start: 0, end: 720, name: MOBILE),
              Breakpoint(start: 721, end: 1280, name: TABLET),
              Breakpoint(start: 1281, end: double.infinity, name: DESKTOP),
            ],
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
          title: "Random Tool",
          theme: ThemeData(
            // textTheme: GoogleFonts.notoSansTcTextTheme(Theme.of(context).textTheme),
            colorScheme: ColorScheme.fromSeed(
                seedColor: context.read<MainViewModel>().randomColor),
            useMaterial3: true,
          ),
          routerConfig: Router.router,
        );
      }),
    );
  }
}
