import 'package:get/get.dart';
import 'package:agroai/features/authentication/screens/login/login.dart';
import 'package:agroai/features/authentication/screens/onboarding/onboarding.dart';
import 'package:agroai/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:agroai/features/authentication/screens/signup/signup.dart';
import 'package:agroai/features/authentication/screens/signup/verify_email.dart';
import 'package:agroai/features/personalization/screens/address/address.dart';
import 'package:agroai/features/personalization/screens/profile/profile.dart';
import 'package:agroai/features/personalization/screens/settings/settings.dart';
import 'package:agroai/features/detection/screens/home/home.dart';
import 'package:agroai/routes/routes.dart';

import '../features/article/article.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.article, page: () => const ArticleScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}