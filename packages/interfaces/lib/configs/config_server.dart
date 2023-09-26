import 'package:interfaces/environment/_exports.dart';

abstract class IConfigServer {
  Map<Environment, Map<String, String>> configs();

  String? getConfigByEnv({required String key});
}
