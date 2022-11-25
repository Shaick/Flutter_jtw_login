import 'package:get/get.dart';
import 'package:jtw_login/app/views/login_page.dart';

import '../views/home_page.dart';
import '../views/register_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => const LoginPage()),
    GetPage(name: Routes.REGISTER, page: () => const RegisterPage()),
    GetPage(name: Routes.HOME, page: () => const HomePage()),
  ];
}
