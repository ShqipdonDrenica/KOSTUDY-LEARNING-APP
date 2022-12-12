import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_study_app/bindings/initial_bindings.dart';
import 'package:flutter_study_app/controllers/theme_controller.dart';
import 'package:flutter_study_app/routes/app_routes.dart';
import 'package:get/get.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   InitialBindings().dependencies();
//   runApp(const MyApp());
// }
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp();
  runApp(Phoenix(child: const MyApp())

      //     DevicePreview(
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),)
      // GetMaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   home: DataUploaderScreen(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
