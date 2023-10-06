// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interfaces/interfaces.dart';
import '../../_exports.dart';

class RoutesImpl {
  static const String home = '/home';
  static const String details = '/details';

  static Map<String, Widget Function(BuildContext)> get routes => {
        home: (context) {
          return AutoBindingPage(
            bindings: [
              HomeBindings(),
            ],
            page: const HomePage(),
          );
        },
        details: (context) {
          var arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          return AutoBindingPage(
            bindings: [
              MovieDetailsBindings(
                movieId: arguments['id'],
                title: arguments['title'],
              ),
            ],
            page: const MovieDetailsPage(),
          );
        }
      };
}

class RouterImpl {
  static const String home = '/';
  static const String details = 'details';

  static final GoRouter routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: home,
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return AutoBindingPage(
            bindings: [
              HomeBindings(),
            ],
            page: const HomePage(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: details,
            path: details,
            builder: (BuildContext context, GoRouterState state) {
              var params = state.uri.queryParameters;
              return AutoBindingPage(
                bindings: [
                  MovieDetailsBindings(
                    movieId: int.tryParse(params['id'] ?? '0') ?? 0,
                    title: params['title'] ?? '',
                  ),
                ],
                page: const MovieDetailsPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
