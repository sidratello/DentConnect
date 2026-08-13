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




 static String? validateAddress(String? value) {
    final address = value?.trim() ?? '';

    if (address.isEmpty) {
      return 'الرجاء إدخال العنوان';
    }

    if (address.length < 3) {
      return 'العنوان يجب أن يتكون من 3 أحرف على الأقل';
    }

    return null;
  }

  static String? validateCity(String? value) {
    final city = value?.trim() ?? '';

    if (city.isEmpty) {
      return 'الرجاء إدخال المدينة';
    }

    if (city.length < 2) {
      return 'اسم المدينة قصير جداً';
    }

    return null;
  }

  static String? validateCountry(String? value) {
    final country = value?.trim() ?? '';

    if (country.isEmpty) {
      return 'الرجاء إدخال البلد';
    }

    if (country.length < 2) {
      return 'اسم البلد قصير جداً';
    }

    return null;
  }


   static  String? validateTitle(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'يرجى إدخال عنوان المنشور';
    }

    if (text.length < 3) {
      return 'يجب أن يتكون العنوان من 3 أحرف على الأقل';
    }

    if (text.length > 200) {
      return 'عنوان المنشور طويل جداً';
    }

    return null;
  }

  static  String? validateContent(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'يرجى إدخال محتوى المنشور';
    }

    if (text.length < 10) {
      return 'يرجى كتابة محتوى أكثر تفصيلاً';
    }

    return null;
  }



static String? validateAdvertisementContent(
  String? value,
) {
  final content = value?.trim() ?? '';

  if (content.isEmpty) {
    return 'الرجاء إدخال محتوى الإعلان';
  }

  if (content.length < 10) {
    return 'يرجى كتابة محتوى إعلان أكثر تفصيلاً';
  }

  if (content.length > 1000) {
    return 'يجب ألا يتجاوز محتوى الإعلان 1000 حرف';
  }

  return null;
}

static String? validateAdvertisementDate(
  String? value,
) {
  if (value == null ||
      value.trim().isEmpty) {
    return 'الرجاء اختيار تاريخ انتهاء الإعلان';
  }

  return null;
}



}