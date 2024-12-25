import 'env_dev.dart';
import 'env_prod.dart';

class Env {
  static const bool isProduction = false;
  static const String baseUrl = isProduction ? EnvProd.baseUrl : EnvDev.baseUrl;
}
