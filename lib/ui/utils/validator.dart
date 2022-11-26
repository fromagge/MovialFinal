class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  static String? validateUserName(String value) {
    if (value.length < 3) {
      return '🚩 El correo electronico es muy corto.';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return '🚩 Field is empty.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.length != 10) {
      return '🚩 Phone number is not valid.';
    } else {
      return null;
    }
  }
}
