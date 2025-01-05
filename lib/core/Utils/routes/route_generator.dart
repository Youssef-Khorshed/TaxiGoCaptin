import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/sign_up_cubit.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:taxi_go_driver/feature/History/Screens/my_history.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/captain_documents.dart';
import 'package:taxi_go_driver/feature/Wallet/screens/wallet_screen.dart';
import 'package:taxi_go_driver/feature/account_screen/presentaion/account_screen.dart';
import 'package:taxi_go_driver/feature/card_screen/presentaion/card_screen.dart';
import 'package:taxi_go_driver/feature/chat/chat.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/earnings_dashboard_screen.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/trip_details.dart';
import 'package:taxi_go_driver/feature/notification/presentaion/notification_view.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/profile_screen.dart';
import 'package:taxi_go_driver/feature/profile/profile.dart';
import 'package:taxi_go_driver/feature/splash_screen/splash_screen.dart';
import 'package:taxi_go_driver/feature/splash_screen/welcome_screen.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/payment_screen.dart';
import '../../../feature/Auth/presentation/controller/create_profile_cubit/create_profile_cubit.dart';
import '../../../feature/Auth/presentation/controller/login_cubit/login_cubit.dart';
import '../../../feature/Auth/presentation/controller/otp_cubit/otp_cubit.dart';
import '../../../feature/Auth/presentation/controller/set_new_password/set_new_password_cubit.dart';
import '../../../feature/Auth/presentation/controller/set_password_cubit/set_password_cubit.dart';
import '../../../feature/Auth/presentation/screens/log_in/forget_password_screen.dart';
import '../../../feature/Auth/presentation/screens/log_in/forget_password_send_otp_screen.dart';
import '../../../feature/Auth/presentation/screens/log_in/log_in_screen.dart';
import '../../../feature/Auth/presentation/screens/log_in/set_new_password_screen.dart';
import '../../../feature/Auth/presentation/screens/log_in/verification_phone_screen.dart';
import '../../../feature/Auth/presentation/screens/sign_up/create_profile_screen.dart';
import '../../../feature/Auth/presentation/screens/sign_up/otp_screen.dart';
import '../../../feature/Auth/presentation/screens/sign_up/set_password_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.wallet:
        return MaterialPageRoute(
          builder: (context) {
            return const WalletScreen();
          },
        );
      // case Routes.scanRoute:
      //   return unDefinedRoute();

      // case Routes.addMoneyRoute:
      //   return unDefinedRoute();
      // //case Routes.addMoneyRoute:
      // //  return unDefinedRoute();

      case Routes.signUp:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt.get<SignUpCubit>(),
                  child: SignUpScreen(),
                ));

      case Routes.otp:
        var phone =
            settings.arguments != null ? settings.arguments as String : null;
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => getIt.get<OtpCubit>(),
            child: OtpScreen(phone: phone),
          );
        });
      case Routes.setPassword:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<SetPasswordCubit>(),
              child: SetPasswordScreen(),
            );
          },
        );

      case Routes.setProfile:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<CreateProfileCubit>(),
              child: CreateProfileScreen(),
            );
          },
        );

      case Routes.logIn:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<LoginCubit>(),
              child: LogInScreen(),
            );
          },
        );

      case Routes.verificationPhoneAndPassword:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<OtpCubit>(),
              child: VerificationPhoneAndPasswordScreen(),
            );
          },
        );

      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgetPasswordScreen();
          },
        );

      case Routes.forgetPasswordSendOtp:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgetPasswordSendOtpScreen();
          },
        );

      case Routes.setNewPassword:
        var phone =
            settings.arguments != null ? settings.arguments as String : null;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<SetNewPasswordCubit>(),
              child: SetNewPasswordScreen(phone: phone),
            );
          },
        );
      case Routes.earningRoute:
        return MaterialPageRoute(
            builder: (_) => const EarningsDashboardScreen());

      case Routes.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());

      case Routes.errorscreen:
        return MaterialPageRoute(
            builder: (_) => CustomErroranimation(
                errormessage: 'Message', lottie: AppLottie.errorFailure));

      case Routes.tripDetailsRoute:
        return MaterialPageRoute(builder: (_) => const TripDetails());

      case Routes.historyRoute:
        return MaterialPageRoute(builder: (_) => HistoryScreen());

      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationView());

      // case Routes.paymentRoute:
      //   return MaterialPageRoute(
      //       builder: (_) => const PaymentSelectMethodScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.paymentDetailsRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());

      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case Routes.accountScreen:
      //   return MaterialPageRoute(builder: (_) => const AccountScreen());
      case Routes.cardScreen:
        return MaterialPageRoute(builder: (_) => const CardScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => const EarningsDashboardScreen());

      case Routes.uploadDocument:
        return MaterialPageRoute(builder: (_) => const CaptainDocuments());
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }

  // static Route<dynamic> unDefinedRoute() {
  //   return MaterialPageRoute(
  //     builder: (_) => Scaffold(
  //       appBar: AppBar(
  //         title: const Text('No Route Found'),
  //       ),
  //       body: const Center(child: Text('No Route Found')),
  //     ),
  //   );
  // }
}
