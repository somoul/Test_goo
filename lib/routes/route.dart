import 'package:get/get.dart';
import 'package:goo_rent/main_page.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:goo_rent/src/authentication/sign_in/presentation/signin_screen.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/screen/start_account_screen.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/screen/verification_otp_screen.dart';
import 'package:goo_rent/src/splash/presentation/screen/splash_screen.dart';

import '../src/authentication/forgot_password/presentation/login_phone_screen.dart';
import '../src/authentication/forgot_password/presentation/new_for_got_password_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initialize,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.authLanding,
      page: () => const StartAccountScreen(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.verifyOtp,
      page: () => const VerifyOTPScreen(),
    ),
    GetPage(
        name: Routes.forloginphone,
        page: () => const LoginPhoneScreen(),
        children: [
          GetPage(
            name: Routes.verifyOtp,
            page: () => const VerifyOTPScreen(),
          ),
          GetPage(
            name: Routes.newforgotpassword,
            page: () => const NewForgotPasswordScreen(),
          ),
        ]),

    //NewForgotPasswordScreen
    // GetPage(
    //   name: Routes.createName,
    //   page: () => CreateNameScreen(),
    // ),
    // GetPage(
    //   name: Routes.createPassword,
    //   page: () => const CreatePasswordScreen(),
    // ),
    GetPage(
      name: Routes.home,
      page: () => const MainPage(),
    ),
  ];
}
