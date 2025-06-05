import 'package:remindery/core/flavor/flavour_config.dart';

import 'develop_env.dart';
import 'prod_env.dart';
import 'stag_env.dart';

abstract class Env {
  static late final String databasePass;
  static late final String baseUrl;

  static void loadEnvironment(Flavor flavor) {
    switch (flavor) {
      case Flavor.develop:
        databasePass = DevelopEnv.databasePass;
        baseUrl = DevelopEnv.baseUrl;
        break;
      case Flavor.stag:
        databasePass = StagEnv.databasePass;
        baseUrl = StagEnv.baseUrl;
        break;
      case Flavor.production:
        databasePass = ProdEnv.databasePass;
        baseUrl = ProdEnv.baseUrl;
        break;
    }
  }
}