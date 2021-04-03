class Validator {
  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'يرجى كتابة الاسم';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    // ريجلر اكسبرشن خاص بالبريد الالكتروني للتحقق من صحته
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'يجب كتابة البريد الالكتروني';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'بريد الكتروني غير صحيح';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'يجب كتابة كلمة المرور';
    } else if (password.length < 6) {
      return 'كلمة المرور يجب أن تحتوي على 6 أحرف وأرقام على الأقل';
    }

    return null;
  }
}
