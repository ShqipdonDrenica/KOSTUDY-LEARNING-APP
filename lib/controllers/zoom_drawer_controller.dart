import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDraweController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  final controller = Get.put<AuthController>(AuthController());
  Rx<User?> user = Rxn();

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void singIn() {}
  void website() {
    _launch("https://www.ubt-uni.net/");
  }

  void facebook() {
    _launch("https://www.facebook.com/ubthighereducationinstitution");
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sd45762@ubt-uni.net',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(url)) {
      throw ' could not laucn $url';
    }
  }

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }
}
