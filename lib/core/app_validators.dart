import 'dart:io';

class AppValidators {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
  final trimmedEmail = email.trim();
    if (!email.contains('@')) {
      return 'البريد الإلكتروني يجب أن يحتوي على @';
    }
      if (!trimmedEmail.contains('.com')) {
    return 'البريد الإلكتروني يجب أن يحتوي على .com';
  }
    

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }

    if (password.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }

    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال $fieldName';
    }

    return null;
  }

  static String? validateVerificationDocument(File? file) {
    if (file == null) {
      return 'الرجاء رفع وثيقة الانتساب';
    }

    return null;
  }
}