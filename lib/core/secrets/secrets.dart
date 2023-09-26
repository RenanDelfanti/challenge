import 'package:interfaces/interfaces.dart';

class SecretsImpl implements ISecrets {
  @override
  String apiKey() {
    return const String.fromEnvironment('apikey', defaultValue: '4e70961b48d3594e642fee1402ba0a35');
  }
}
