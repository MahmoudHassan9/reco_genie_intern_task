extension ValidationEx on String? {
  String? isValidEmail() {
    RegExp gmailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (this?.trim().isEmpty == true || this == null) {
      return ' Please enter an Email';
    } else if (!gmailRegExp.hasMatch(this!)) {
      return 'Please enter valid Email';
    }
    return null;
  }

  String? isValidPassword() {
    if (this == null || this!.trim().isEmpty) {
      return 'Please enter password';
    } else if (this!.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'(?=.*?[A-Z])').hasMatch(this!)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'(?=.*?[a-z])').hasMatch(this!)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'(?=.*?[0-9])').hasMatch(this!)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(this!)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
}
