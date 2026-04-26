class RegexUtils {
  static const String username = r'^.{3,}$';
  static const String password = r'^.{8,}$';
  static const String email =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
  static const String phoneNumber = r'^(?:\+(?:84|255)\d{9}|0\d{9})?$';

  static bool isUsernameValid(String userName) {
    RegExp regExp = RegExp(username);
    //RegExp regExp = RegExp(r'^[a-zA-Z0-9]{3,}$');
    return regExp.hasMatch(userName);
  }

  static bool isPasswordValid(String pw) {
    RegExp regExp = RegExp(password);
    //RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$');
    return regExp.hasMatch(pw);
  }

  static bool isEmailValid(String e) {
    RegExp regExp = RegExp(email);
    return regExp.hasMatch(e);
  }

  static bool isPhoneNumberValid(String phoneNo) {
    RegExp regExp = RegExp(phoneNumber);
    return regExp.hasMatch(phoneNo);
  }
}
