import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controllers/User/auth_controller.dart';
import 'Controllers/User/main_controller.dart';
import 'Localization/localization.dart';
import 'Services/api.dart';
import 'Util/Globals/globals.dart';
import 'Util/theme.dart';
import 'routes.dart';

Future<void> main() async {
  Api.initializeInterceptors();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await init();
  getThemeMode();
  //------------- DeviceOrientation ---------------//
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  MainController main = Get.put(MainController());
  AuthController authController = Get.put(AuthController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alfal Pay',
      locale: main.language,
      fallbackLocale: const Locale('en'),
      translations: Localization(),
      themeMode: ThemeMode.light,
      theme: theme(),
      darkTheme: themeDark(),
      getPages: routes,
    );
  }
}
