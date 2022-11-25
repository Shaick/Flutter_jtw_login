import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jtw_login/app/services/shared_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLogged = await SharedService.isLoggedIn();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Club Nail',
      //initialBinding: ApplicationBindings(),
      initialRoute: isLogged ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
