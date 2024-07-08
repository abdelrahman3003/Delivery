
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../view/auth/check_email.dart';
import '../../view/auth/reset_password.dart';
import '../../view/auth/signin.dart';
import '../../view/auth/verifycode.dart';
import '../../view/auth/widgets/restpassword/reset_password_succes.dart';
import '../../view/auth/widgets/signup/success_signup.dart';
import '../middleware/appmiddleware.dart';

const kSignin = "/Signin";
const kCheckEmail = "/CheckEmail";
const kVerifyCode = "/kVerifyCode";
const kSignupSucess = "/SuccessSignup";
const kResetpasswordsucsess = "/Resetpasswordsucsess";
const kRestPassword = "/RestPassword";
List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => const Signin(), middlewares: [
    AppMiddleWare(),
  ]),
  GetPage(name: kCheckEmail, page: () => const CheckEmail()),
  GetPage(name: kVerifyCode, page: () => const VerifyCode()),
  GetPage(name: kRestPassword, page: () => const RestPassword()),
  GetPage(name: kSignupSucess, page: () => const SuccessSignup()),
  GetPage(name: kResetpasswordsucsess, page: () => const RestSuccesPassword()),
];
