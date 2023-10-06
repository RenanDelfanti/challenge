import 'package:flutter/material.dart';
import 'core/_exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const JustMoviesApp());
}

class JustMoviesApp extends StatelessWidget {
  const JustMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Just Popular Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //routes: RoutesImpl.routes,
      //initialRoute: RoutesImpl.home,
      routerConfig: RouterImpl.routes,
    );
  }
}
