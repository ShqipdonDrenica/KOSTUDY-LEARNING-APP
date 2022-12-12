import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

class BottomSheetCreateWidget extends StatefulWidget {
  const BottomSheetCreateWidget({super.key});

  @override
  State<BottomSheetCreateWidget> createState() =>
      _BottomSheetCreateWidgetState();
}

class _BottomSheetCreateWidgetState extends State<BottomSheetCreateWidget> {
  final quizPaperController = Get.find<QuizPaperController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Plotesoni te dhenat per kuizin',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                callBackClear: () {},
                callBackPrefix: () {},
                callBackSearch: () {},
                onChanged: (value) {},
                textEditingController:
                    quizPaperController.titleQuizController.value,
                hintText: 'Titulli i kuizit',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                callBackClear: () {},
                callBackPrefix: () {},
                callBackSearch: () {},
                onChanged: (value) {},
                textEditingController:
                    quizPaperController.descriptionQuizController.value,
                hintText: 'Pershkrimi i kuizit',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                callBackClear: () {},
                callBackPrefix: () {},
                callBackSearch: () {},
                onChanged: (value) {},
                textEditingController:
                    quizPaperController.idQuizControllerController.value,
                hintText: 'Id i kuizit',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                callBackClear: () {},
                callBackPrefix: () {},
                callBackSearch: () {},
                onChanged: (value) {},
                textEditingController:
                    quizPaperController.imageQuizController.value,
                hintText: 'Foto e kuizit',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                callBackClear: () {},
                callBackPrefix: () {},
                callBackSearch: () {},
                onChanged: (value) {},
                textEditingController:
                    quizPaperController.numberOfQuestionController.value,
                hintText: 'Numri i pyetjeve ne kuiz',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                callBackClear: () {},
                callBackPrefix: () {},
                callBackSearch: () {},
                onChanged: (value) {},
                textEditingController:
                    quizPaperController.timeQuizController.value,
                hintText: 'Koha caktuar e kuizit (ne sekonda)',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 40,
                      ),
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        child: const Text(
                          'Krijo kuizin',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      )),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
