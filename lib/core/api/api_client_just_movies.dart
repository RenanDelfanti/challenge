import 'package:interfaces/interfaces.dart';

import '../_exports.dart';

class ApiClientImpl extends XDApiClient {
  final IConfigServer configServerJustMovies;

  ApiClientImpl({required this.configServerJustMovies}) : super(configServer: configServerJustMovies);

  @override
  bool get enableMock => false;
}
