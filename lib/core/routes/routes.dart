// coverage:ignore-file
import 'package:flutter/material.dart';
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
