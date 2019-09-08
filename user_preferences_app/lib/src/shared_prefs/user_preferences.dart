import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  // Ninguna de estas propiedades se usa
  int _gender;
  String _name;
  bool _notificacionPermissions;

  // Patrón singleton
  static final UserPreferences _singleton = new UserPreferences._internal();

  SharedPreferences _prefs;


  UserPreferences._internal();

  factory UserPreferences() {
    return _singleton;
  }

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET Y SET  del género
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }
  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  // GET Y SET  de los permisos
  get notificacionPermissions {
    return _prefs.getBool('notificacionPermissions') ?? false;
  }
  set notificacionPermissions(bool value) {
    _prefs.setBool('notificacionPermissions', value);
  }

  // GET Y SET  nombre usuario
  get userName {
    return _prefs.getString('userName') ?? '';
  }
  set userName(String value) {
    _prefs.setString('userName', value);
  }

}