class AppValidator{

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter email';
    }
    RegExp emailRegexp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegexp.hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? validatePhone(value) {
    RegExp phoneRegex = RegExp(r'^(\+|00)?[0-9]+$');
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Please enter numeric value only';
    } else if (value.length != 10) {
      return 'Please enter 10 digit valid phone number';
    }
    return null;
  }

  String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please enter  username';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter  password';
    }
    return null;
  }
}