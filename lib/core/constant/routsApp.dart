import 'package:delivery/view/home/details_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../view/auth/check_email.dart';
import '../../view/auth/reset_password.dart';
import '../../view/auth/signin.dart';
import '../../view/auth/verifycode.dart';
import '../../view/auth/widgets/restpassword/reset_password_succes.dart';
import '../../view/home/accepted_view.dart';
import '../../view/home/home_view.dart';
import '../../view/home/pending_view.dart';
import '../../view/home/setting_view.dart';
import '../middleware/appmiddleware.dart';

const kSignin = "/Signin";
const kCheckEmail = "/CheckEmail";
const kVerifyCode = "/kVerifyCode";
const kSignupSucess = "/SuccessSignup";
const kResetpasswordsucsess = "/Resetpasswordsucsess";
const kRestPassword = "/RestPassword";
const kHomeView = "/HomeView";
const kPendingView = "/PendingView";
const kAcceptedView = "/kAcceptedView";
const kSettingView = "/SettingView";
const kDetailsView = "/DetailsView";
List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: "/", page: () => const Signin(), middlewares: [AppMiddleWare()]),
  GetPage(name: kCheckEmail, page: () => const CheckEmail()),
  GetPage(name: kVerifyCode, page: () => const VerifyCode()),
  GetPage(name: kRestPassword, page: () => const RestPassword()),
  GetPage(name: kResetpasswordsucsess, page: () => const RestSuccesPassword()),
  GetPage(name: kHomeView, page: () => const HomeView()),
  GetPage(name: kPendingView, page: () => const PendingView()),
  GetPage(name: kAcceptedView, page: () => const AcceptedView()),
  GetPage(name: kSettingView, page: () => const SettingView()),
  GetPage(name: kDetailsView, page: () => const DetailsView()),
];
