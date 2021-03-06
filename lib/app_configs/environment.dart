///
/// Created by Sunil Kumar from Boiler plate
///
mixin Environment {
  static const String environment =
      String.fromEnvironment("env", defaultValue: 'dev');

  static const String baseApiUrl = environment == 'prod'
      ? 'http://192.168.29.134:3030'
      : 'http://192.168.29.134:3030';
  static const fontFamily = 'Poppins';
}
