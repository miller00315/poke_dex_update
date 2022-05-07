import 'package:global_configuration/global_configuration.dart';

class Env {
  static final Env _singleton = Env._internal();

  factory Env() => _singleton;

  final Map<String, String> _values = <String, String>{};

  Env._internal() {
    for (final key in _envKeys) {
      _values[key] = GlobalConfiguration().get(key);
    }
  }

  String? get apiUrl => _getValue(_envKeys[0]);

  String? _getValue(String key) {
    if (_values[key] == null) {
      throw Exception(
          'Environment key $key was not set in assets/cfg/env.json or assets/cfg/release_env.json');
    }

    return _values[key];
  }

  final List<String> _envKeys = ['api_url'];
}
