///tet
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import '../../../feature/RequestDriver/presentaion/captain_documents.dart';
import '../../../feature/account_screen/presentaion/account_screen.dart';
import '../../../feature/card_screen/presentaion/card_screen.dart';
import '../../../feature/earnings_dashboard/presentaion/earnings_dashboard_screen.dart';
import '../../../feature/earnings_dashboard/presentaion/widgets/trip_details.dart';
import '../../../feature/history/presentaion/history_view.dart';
import '../../../feature/mission/presentaion/mission_view.dart';
import '../../../feature/notification/presentaion/notification_view.dart';
import '../../../feature/otp_view.dart/presentaion/otp_view.dart';
import '../../../feature/payment/presentaion/payment_screen.dart';
import '../../../feature/payment/presentaion/wallet_screen.dart';
import '../../../feature/profile/presentaion/edit_profile_screen.dart';
import '../../../feature/profile/presentaion/profile_screen.dart';
import '../../../feature/sign_in/presentaion/otp_screen.dart';
import '../../../feature/sign_in/presentaion/set_password.dart';
import '../../../feature/sign_in/presentaion/sign_in_view.dart';
import '../../../feature/sign_up _screen/sign_up_screen.dart';
import '../../../feature/splash_screen/splash_screen.dart';
import '../../../feature/splash_screen/welcome_screen.dart';
import '../../../feature/trip_detales/presentaion/map_screen.dart';
import '../../../feature/verification/verification_view.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.verificationRoute:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case Routes.setPassowrdRoute:
        return MaterialPageRoute(builder: (_) => const SetPasswordView());

      case Routes.sendVerificatiouRoute:
        return MaterialPageRoute(builder: (_) => VerificationScreen());

      case Routes.phoneVerificationRoute:
        return unDefinedRoute();

      case Routes.scanRoute:
        return unDefinedRoute();

      case Routes.addMoneyRoute:
        return unDefinedRoute();

      case Routes.earningRoute:
        return MaterialPageRoute(
            builder: (_) => const EarningsDashboardScreen());

      case Routes.walletRoute:
        return MaterialPageRoute(builder: (_) => const WalletScreen());

      case Routes.errorscreen:
        return MaterialPageRoute(
            builder: (_) => CustomErroranimation(
                errormessage: 'Message', lottie: AppLottie.errorFailure));

      case Routes.tripDetailsRoute:
        return MaterialPageRoute(builder: (_) => const TripDetails());

      case Routes.historyRoute:
        return MaterialPageRoute(builder: (_) => const HistoryView());

      case Routes.missionRoute:
        return MaterialPageRoute(builder: (_) => const MissionView());

      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationView());

      case Routes.paymentRoute:
        return MaterialPageRoute(
            builder: (_) => const PaymentSelectMethodScreen());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.confirmMobileOrEmail:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.accountScreen:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case Routes.cardScreen:
        return MaterialPageRoute(builder: (_) => const CardScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => const EarningsDashboardScreen());
      case Routes.mabScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case Routes.otpScreenForget:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.uploadDocument:
        return MaterialPageRoute(builder: (_) => const CaptainDocuments());
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
