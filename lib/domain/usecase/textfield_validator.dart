class TextFieldValidator {
  static bool isValid(String value) {
    return value.isNotEmpty;
  }

  static String? regular(String? value) {
    if (value == null) return "Tidak boleh kosong";
    if (value.isEmpty) return "Tidak boleh kosong";
    return null;
  }
}
