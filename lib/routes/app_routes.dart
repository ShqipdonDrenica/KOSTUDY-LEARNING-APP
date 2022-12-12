import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/controllers/question_papers/question_controller.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/introduction/introduction.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/screens/questions/questions_screen.dart';
import 'package:flutter_study_app/screens/questions/test_overview_screen.dart';
import 'package:flutter_study_app/screens/splash/splash_screen.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(ZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => const QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionController>(QuestionController());
            })),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => const TestOverviewScreen()),
      ];
}
