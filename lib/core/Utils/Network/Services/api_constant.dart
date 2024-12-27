class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String getName = '';
  static const String postName = '';
  static const kModelFont = 'Medel';

  static String login='/login';
  static String register='/captain/register';
  static String sendVerification="/ask-verification-code";
  static String verifyAccount="/verify-email";
 static String forgotPassword="/forgot-password";

  static String forgotPasswordCheckCode="/forgot-password-check-code";

  static String setPassword="/set-password";

  static String cities='/cities';
  static String logout="/logout";
  static String forgotPasswordSet="/forgot-password-set";
  static String createProfile="/profile/update";
  static String districts="/districts-by-city";



  static const payAfterRide = '$baseUrl/captain/rides/payment-cash';
  static const completeRide = '$baseUrl/captain/rides/get-last';
  static const captainDocumentsEndPoint = '$baseUrl/captain/files';
  static const nearbyRideRequestsEndPoint =
      '$baseUrl/captain/rides/find-nearby-rides';
  static const rooms = '${baseUrl}/captain/rides/get-messages';
  static const sendchat = '${baseUrl}/captain/rides/send-message';
}
