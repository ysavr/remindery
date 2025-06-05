import 'package:envied/envied.dart';

part 'prod_env.g.dart';

/// TODO
/// 1. generate .g.dart
/// dart run build_runner build
///   or
/// dart run build_runner clean
/// dart run build_runner build --delete-conflicting-outputs

@Envied(path: 'environment/production.env')
abstract class ProdEnv {
  @EnviedField(varName: 'DATABASE_PASSWORD', obfuscate: true)
  static String databasePass = _ProdEnv.databasePass;

  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static String baseUrl = _ProdEnv.baseUrl;
}