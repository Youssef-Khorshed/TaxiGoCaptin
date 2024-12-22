class WalletFormFieldValidator {
  static String? numbers(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return "Field Required";
      }
      final number = int.tryParse(value);
      if (number == null || number < 1001) {
        return "Amount must be at least 1001";
      }
    } else {
      return "error_field_required";
    }
    return null;
  }
}
