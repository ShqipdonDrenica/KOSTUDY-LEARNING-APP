import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            "assets/images/kstdicon.svg",
            width: 150,
            height: 150,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60.0),
            child: Text(
              'Ky është një aplikacion studimi. Ju mund të përdorni si të dëshironi. Ju keni qasje të plotë në të gjitha materialet në këtë kurs',
              style: TextStyle(
                  color: onSurfaceTextColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          MainButton(
              onTap: () {
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 12,
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                    ),
                  ),
                  Center(
                    child: Text('Kyqu me google',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
