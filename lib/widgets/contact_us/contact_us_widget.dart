import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/contactUs_controller.dart';
import 'package:flutter_study_app/widgets/text_field_contactUs.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ContactUsWidget extends StatelessWidget {
  ContactUsWidget({super.key});
  final contactUsController =
      Get.put<ContactUsController>(ContactUsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Avenir'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldContactUsWidget(
              hintText: 'Name',
              maxLines: 1,
              onChanged: (value) {},
              textEditingController: contactUsController.nameController.value,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Surname',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Avenir'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldContactUsWidget(
              hintText: 'Surname',
              maxLines: 1,
              onChanged: (value) {},
              textEditingController:
                  contactUsController.surnameController.value,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your coment',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Avenir'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldContactUsWidget(
              hintText: 'Your Coment',
              maxLines: 4,
              onChanged: (value) {},
              textEditingController:
                  contactUsController.commentController.value,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextButton(
                  onPressed: () async {
                    await contactUsController.createContactUs(
                        name: contactUsController.nameController.value.text,
                        surname:
                            contactUsController.surnameController.value.text,
                        comment:
                            contactUsController.commentController.value.text);
                    Get.back();
                    contactUsController.nameController.value.clear();
                    contactUsController.surnameController.value.clear();
                    contactUsController.commentController.value.clear();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Dërgo',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
