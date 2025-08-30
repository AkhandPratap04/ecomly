import 'package:flutter/material.dart';
import 'package:prakhya_ecomly/core/res/styles/colours.dart';
import 'package:prakhya_ecomly/core/services/router.dart';

import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colours.lightThemePrimaryColour,
      ),
      fontFamily: "Switzer",
      scaffoldBackgroundColor: Colours.lightThemeTintStockColour,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colours.lightThemeTintStockColour,
        foregroundColor: Colours.lightThemePrimaryTextColour,
      ),
      useMaterial3: true,
    );
    return MaterialApp.router(
      title: "Ecomly",
      routerConfig: router,
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: theme.copyWith(
        scaffoldBackgroundColor: Colours.darkThemeBGDark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colours.darkThemeBGDark,
          foregroundColor: Colours.lightThemeWhiteColour,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
