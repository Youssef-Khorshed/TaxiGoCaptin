class OTPModel {
  final String emailOrPhone;

  OTPModel({required this.emailOrPhone});

  String maskedEmailOrPhone() {
    if (emailOrPhone.contains('@')) {
      final parts = emailOrPhone.split('@');
      final username = parts[0];
      final domain = parts[1];
      return '${username.substring(0, 2)}****@${domain}';
    } else {
      return '***** ***${emailOrPhone.substring(emailOrPhone.length - 2)}';
    }
  }
}
