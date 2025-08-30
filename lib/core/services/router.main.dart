part of 'router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: "/",
      redirect: (_, state) {
        final helper =
            sl<CacheHelper>()
              ..getSessionToken()
              ..getUserId();

        if ((Cache.instance.sessionToken == null ||
                Cache.instance.userId == null) &&
            !helper.isFirstTime()) {
          return LoginScreen.path;
        }
        if (state.extra == 'home') return HomeScreen.path;
        return null;
      },
      builder: (_, __) {
        CacheHelper helper =
            sl<CacheHelper>()
              ..getSessionToken()
              ..getUserId();
        if (helper.isFirstTime()) {
          return OnBoardingScreen();
        }
        return SplashScreen();
      },
    ),
    GoRoute(path: LoginScreen.path, builder: (_, __) => LoginScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return DashboardScreen(state: state, child: child);
      },
      routes: [
        GoRoute(path: HomeScreen.path, builder: (_, __) => HomeScreen()),
      ],
    ),
  ],
);
