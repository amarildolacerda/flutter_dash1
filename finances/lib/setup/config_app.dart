class ConfigApp {
  static final _singleton = ConfigApp._create();
  ConfigApp._create();
  factory ConfigApp() => _singleton;

  static beforeInit() {
    ConfigApp(); // init

    return _singleton;
  }

  static afterInit() {
    ConfigApp();

    return _singleton;
  }
}
