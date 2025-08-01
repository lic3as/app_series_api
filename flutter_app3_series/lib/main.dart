import 'package:flutter_app3_series/base_screen.dart';
import 'package:flutter_app3_series/fav_tv_show_screen.dart';
import 'package:flutter_app3_series/my_theme_model.dart';
import 'package:flutter_app3_series/tv_show_model.dart';
import 'package:flutter_app3_series/tv_show_screen.dart';
import 'package:flutter_app3_series/tv_show_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TvShowModel()),
        ChangeNotifierProvider(create: (context) => MyThemeModel()),
      ],
      child: const MainApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => BaseScreen(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => FavTvShowScreen()),
        GoRoute(
          path: '/tvShow/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return TvShowScreen(id: id);
          },
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => TvShowSearchScreen(),
        ),
      ],
    ),
  ],
);

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: context.read<MyThemeModel>().customTheme,
      darkTheme: context.read<MyThemeModel>().customThemeDark,
      themeMode: context.watch<MyThemeModel>().isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: _router,
    );
  }
}
