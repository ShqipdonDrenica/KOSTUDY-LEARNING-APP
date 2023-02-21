import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/edit_quiz_controller.dart';
import 'package:flutter_study_app/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

class BottomSheetEditWidget extends StatelessWidget {
  const BottomSheetEditWidget({super.key});
  // static QuestionPaperModel? quiz;
  @override
  Widget build(BuildContext context) {
    final editQuizController =
        Get.put<EditQuizController>(EditQuizController());

    return Obx(
      () => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 80),
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      editQuizController.titleQuizController.value,
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
                      editQuizController.descriptionQuizController.value,
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
                      editQuizController.imageQuizController.value,
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
                      editQuizController.timeQuizController.value,
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
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            await editQuizController.updateQuiz();
                          },
                          child: const Text(
                            'Redakto kuizin',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                const Text(
                  'Plotesoni pyetjet per kuizin',
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
                      editQuizController.firstQuestionController.value,
                  hintText: 'Shkruaj pytjen e pare',
                  prefixText: '1:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.firstCorrectAnswerController.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.firstAnswerControllerA.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'A:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.firstAnswerControllerB.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'B:',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.firstAnswerControllerC.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'C:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.firstAnswerControllerD.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'D:',
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 40,
                      left: 230,
                    ),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text(
                        'Redakto pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await editQuizController.updateQuestion(
                          correctAnswer: editQuizController
                              .firstCorrectAnswerController.value.text
                              .toUpperCase(),
                          question: editQuizController
                              .firstQuestionController.value.text,
                          index: 0,
                        );
                        await editQuizController.updateAnswerA(
                            answer: editQuizController
                                .firstAnswerControllerA.value.text,
                            index: 0);
                        await editQuizController.updateAnswerB(
                            answer: editQuizController
                                .firstAnswerControllerB.value.text,
                            index: 0);
                        await editQuizController.updateAnswerC(
                            answer: editQuizController
                                .firstAnswerControllerC.value.text,
                            index: 0);
                        await editQuizController.updateAnswerD(
                            answer: editQuizController
                                .firstAnswerControllerD.value.text,
                            index: 0);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.secondQuestionController.value,
                  hintText: 'Shkruaj pyetjen e dyt',
                  prefixText: '2:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.secondCorrectAnswerController.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.secondAnswerControllerA.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'A:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.secondAnswerControllerB.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'B:',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.secondAnswerControllerC.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'C:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.secondAnswerControllerD.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'D:',
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 40,
                      left: 230,
                    ),
                    width: 110,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text(
                        'Redakto pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await editQuizController.updateQuestion(
                          correctAnswer: editQuizController
                              .secondCorrectAnswerController.value.text
                              .toUpperCase(),
                          question: editQuizController
                              .secondQuestionController.value.text,
                          index: 1,
                        );
                        await editQuizController.updateAnswerA(
                            answer: editQuizController
                                .secondAnswerControllerA.value.text,
                            index: 1);
                        await editQuizController.updateAnswerB(
                            answer: editQuizController
                                .secondAnswerControllerB.value.text,
                            index: 1);
                        await editQuizController.updateAnswerC(
                            answer: editQuizController
                                .secondAnswerControllerC.value.text,
                            index: 1);
                        await editQuizController.updateAnswerD(
                            answer: editQuizController
                                .secondAnswerControllerD.value.text,
                            index: 1);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.thirdQuestionController.value,
                  hintText: 'Shkruaj pytjen e tret',
                  prefixText: '3:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.thirdCorrectAnswerController.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.thirdAnswerControllerA.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'A:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.thirdAnswerControllerB.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'B:',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.thirdAnswerControllerC.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'C:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.thirdAnswerControllerD.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'D:',
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 40,
                      left: 230,
                    ),
                    width: 110,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text(
                        'redakto pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await editQuizController.updateQuestion(
                          correctAnswer: editQuizController
                              .thirdCorrectAnswerController.value.text
                              .toUpperCase(),
                          question: editQuizController
                              .thirdQuestionController.value.text,
                          index: 2,
                        );
                        await editQuizController.updateAnswerA(
                            answer: editQuizController
                                .thirdAnswerControllerA.value.text,
                            index: 2);
                        await editQuizController.updateAnswerB(
                            answer: editQuizController
                                .thirdAnswerControllerB.value.text,
                            index: 2);
                        await editQuizController.updateAnswerC(
                            answer: editQuizController
                                .thirdAnswerControllerC.value.text,
                            index: 2);
                        await editQuizController.updateAnswerD(
                            answer: editQuizController
                                .thirdAnswerControllerD.value.text,
                            index: 2);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.fourthQuestionController.value,
                  hintText: 'Shkruaj pytjen e katert',
                  prefixText: '4:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.fourthCorrectAnswerController.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fourthAnswerControllerA.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'A:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fourthAnswerControllerB.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'B:',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fourthAnswerControllerC.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'C:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fourthAnswerControllerD.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'D:',
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 40,
                      left: 230,
                    ),
                    width: 110,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text(
                        'redakto pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await editQuizController.updateQuestion(
                          correctAnswer: editQuizController
                              .fourthCorrectAnswerController.value.text
                              .toUpperCase(),
                          question: editQuizController
                              .fourthQuestionController.value.text,
                          index: 3,
                        );
                        await editQuizController.updateAnswerA(
                            answer: editQuizController
                                .fourthAnswerControllerA.value.text,
                            index: 3);
                        await editQuizController.updateAnswerB(
                            answer: editQuizController
                                .fourthAnswerControllerB.value.text,
                            index: 3);
                        await editQuizController.updateAnswerC(
                            answer: editQuizController
                                .fourthAnswerControllerC.value.text,
                            index: 3);
                        await editQuizController.updateAnswerD(
                            answer: editQuizController
                                .fourthAnswerControllerD.value.text,
                            index: 3);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.fifthQuestionController.value,
                  hintText: 'Shkruaj pytjen e peste',
                  prefixText: '5:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      editQuizController.fifthCorrectAnswerController.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fifthAnswerControllerA.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'A:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fifthAnswerControllerB.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'B:',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fifthAnswerControllerC.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'C:',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            editQuizController.fifthAnswerControllerD.value,
                        hintText: 'Shkruaj pergjigjen',
                        prefixText: 'D:',
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 40,
                      left: 230,
                    ),
                    width: 110,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text(
                        'redakto pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await editQuizController.updateQuestion(
                          correctAnswer: editQuizController
                              .fifthCorrectAnswerController.value.text
                              .toUpperCase(),
                          question: editQuizController
                              .fifthQuestionController.value.text,
                          index: 4,
                        );
                        await editQuizController.updateAnswerA(
                            answer: editQuizController
                                .fifthAnswerControllerA.value.text,
                            index: 4);
                        await editQuizController.updateAnswerB(
                            answer: editQuizController
                                .fifthAnswerControllerB.value.text,
                            index: 4);
                        await editQuizController.updateAnswerC(
                            answer: editQuizController
                                .fifthAnswerControllerC.value.text,
                            index: 4);
                        await editQuizController.updateAnswerD(
                            answer: editQuizController
                                .fifthAnswerControllerD.value.text,
                            index: 4);
                      },
                    )),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
