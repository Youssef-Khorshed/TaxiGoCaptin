mixin ValidationMixin {
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please Enter New Password';
    }
    var regex = RegExp(
      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
    );

    if (!regex.hasMatch(value)) {
      return 'Password must be atleast A-Z, a-z, @-#-&.. , 1-9';
    }

    return null;
  }
}
