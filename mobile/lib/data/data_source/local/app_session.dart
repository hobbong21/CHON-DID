class AppSession {
  int _count = 0;
  int get count => _count;

  static final AppSession _instance = AppSession._internal();

  factory AppSession() {
    return _instance;
  }
  AppSession._internal();

  void setCount (int value) {
    _count = value;
  }

  void clear() {
    _count = 0;
  }
}
