import 'package:elevate_ecommerce/bindings/initial_biding.dart';
import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/theme/theme_controller.dart';
import 'package:elevate_ecommerce/routes/routes.dart';
import 'package:elevate_ecommerce/shared/helper/keyboard.dart';
import 'package:elevate_ecommerce/themes/themes_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Stripe
  Stripe.publishableKey = stripePublishableKey;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtil.hideKeyboard(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Elevate Ecommerce",
        //locale: Locale(GetStorage().read<String>('lang').toString()),
        home: const SplashScreen(),
        initialBinding: InitialBinding(),
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: getThemeMode(themeController.theme),
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>("auth") == true
            ? Routes.home
            : Routes.splash,
        getPages: Routes.routes,
      ),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}



