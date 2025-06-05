import 'package:envied/envied.dart';

part 'develop_env.g.dart';

/// TODO
/// 1. generate .g.dart
/// dart run build_runner build
///   or
/// dart run build_runner clean
/// dart run build_runner build --delete-conflicting-outputs

@Envied(path: 'environment/develop.env')
abstract class DevelopEnv {
  @EnviedField(varName: 'DATABASE_PASSWORD', obfuscate: true)
  static String databasePass = _DevelopEnv.databasePass;

  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static String baseUrl = _DevelopEnv.baseUrl;
}
