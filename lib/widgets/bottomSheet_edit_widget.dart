import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/edit_quiz_controller.dart';
import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

class BottomSheetEditWidget extends StatelessWidget {
  const BottomSheetEditWidget({super.key});
  // static QuestionPaperModel? quiz;
  @override
  Widget build(BuildContext context) {
    final quizPaperController = Get.find<QuizPaperController>();

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
                          // quizPaperController.createQuiz(
                          //   description: quizPaperController
                          //       .descriptionQuizController.value.text,
                          //   id: quizPaperController.idOfQuiz.toString(),
                          //   imageurl: quizPaperController
                          //       .imageQuizController.value.text,
                          //   questioncount: 5,
                          //   timeseconds: int.parse(quizPaperController
                          //       .timeQuizController.value.text),
                          //   title: quizPaperController
                          //       .titleQuizController.value.text,
                          // );
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
                      quizPaperController.firstQuestionController.value,
                  hintText: 'Shkruaj pytjen e pare',
                  prefixText: '1:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      quizPaperController.firstCorrectAnswer.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                // TextFormFieldWidget(

                //   callBackClear: () {},
                //   callBackPrefix: () {},
                //   callBackSearch: () {},
                //   onChanged: (value) {},
                //   textEditingController:
                //       quizPaperController.idOfQuizController.value,
                //   hintText: 'Shkruaj id e kuizit',
                // ),
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
                            quizPaperController.firstAnswerControllerA.value,
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
                            quizPaperController.firstAnswerControllerB.value,
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
                            quizPaperController.firstAnswerControllerC.value,
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
                            quizPaperController.firstAnswerControllerD.value,
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
                        'Krijo pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        quizPaperController.idOfQuestion++;
                        quizPaperController.saveQuestionId();
                        quizPaperController.createQuestion(
                          id: quizPaperController.idOfQuestion.toString(),
                          correctAnswer: quizPaperController
                              .firstCorrectAnswer.value.text
                              .toUpperCase(),
                          question: quizPaperController
                              .firstQuestionController.value.text,
                        );
                        quizPaperController.createAnswerA(
                            answer: quizPaperController
                                .firstAnswerControllerA.value.text,
                            identifier: quizPaperController
                                        .firstAnswerControllerA.value.text ==
                                    quizPaperController
                                        .firstAnswerControllerA.value.text
                                ? 'A'
                                : 'j');
                        quizPaperController.createAnswerB(
                            answer: quizPaperController
                                .firstAnswerControllerB.value.text,
                            identifier: quizPaperController
                                        .firstAnswerControllerB.value.text ==
                                    quizPaperController
                                        .firstAnswerControllerB.value.text
                                ? 'B'
                                : 'j');
                        quizPaperController.createAnswerC(
                            answer: quizPaperController
                                .firstAnswerControllerC.value.text,
                            identifier: quizPaperController
                                        .firstAnswerControllerC.value.text ==
                                    quizPaperController
                                        .firstAnswerControllerC.value.text
                                ? 'C'
                                : 'j');
                        quizPaperController.createAnswerD(
                            answer: quizPaperController
                                .firstAnswerControllerD.value.text,
                            identifier: quizPaperController
                                        .firstAnswerControllerD.value.text ==
                                    quizPaperController
                                        .firstAnswerControllerD.value.text
                                ? 'D'
                                : 'j');
                        // quizPaperController.createAnswers();
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
                      quizPaperController.secondQuestionController.value,
                  hintText: 'Shkruaj pyetjen e dyt',
                  prefixText: '2:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      quizPaperController.secondCorrectAnswer.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                // TextFormFieldWidget(

                //   callBackClear: () {},
                //   callBackPrefix: () {},
                //   callBackSearch: () {},
                //   onChanged: (value) {},
                //   textEditingController:
                //       quizPaperController.idOfQuizController.value,
                //   hintText: 'Shkruaj id e kuizit',
                // ),
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
                            quizPaperController.secondAnswerControllerA.value,
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
                            quizPaperController.secondAnswerControllerB.value,
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
                            quizPaperController.secondAnswerControllerC.value,
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
                            quizPaperController.secondAnswerControllerD.value,
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
                        'Krijo pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        quizPaperController.idOfQuestion++;
                        quizPaperController.saveQuestionId();
                        quizPaperController.createQuestion(
                          id: quizPaperController.idOfQuestion.toString(),
                          correctAnswer: quizPaperController
                              .secondCorrectAnswer.value.text
                              .toUpperCase(),
                          question: quizPaperController
                              .secondQuestionController.value.text,
                        );
                        quizPaperController.createAnswerA(
                            answer: quizPaperController
                                .secondAnswerControllerA.value.text,
                            identifier: quizPaperController
                                        .secondAnswerControllerA.value.text ==
                                    quizPaperController
                                        .secondAnswerControllerA.value.text
                                ? 'A'
                                : 'j');
                        quizPaperController.createAnswerB(
                            answer: quizPaperController
                                .secondAnswerControllerB.value.text,
                            identifier: quizPaperController
                                        .secondAnswerControllerB.value.text ==
                                    quizPaperController
                                        .secondAnswerControllerB.value.text
                                ? 'B'
                                : 'j');
                        quizPaperController.createAnswerC(
                            answer: quizPaperController
                                .secondAnswerControllerC.value.text,
                            identifier: quizPaperController
                                        .secondAnswerControllerC.value.text ==
                                    quizPaperController
                                        .secondAnswerControllerC.value.text
                                ? 'C'
                                : 'j');
                        quizPaperController.createAnswerD(
                            answer: quizPaperController
                                .secondAnswerControllerD.value.text,
                            identifier: quizPaperController
                                        .secondAnswerControllerD.value.text ==
                                    quizPaperController
                                        .secondAnswerControllerD.value.text
                                ? 'D'
                                : 'j');
                        // quizPaperController.createAnswers();
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
                      quizPaperController.thirdQuestionController.value,
                  hintText: 'Shkruaj pytjen e tret',
                  prefixText: '3:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      quizPaperController.thirdCorrectAnswer.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                // TextFormFieldWidget(

                //   callBackClear: () {},
                //   callBackPrefix: () {},
                //   callBackSearch: () {},
                //   onChanged: (value) {},
                //   textEditingController:
                //       quizPaperController.idOfQuizController.value,
                //   hintText: 'Shkruaj id e kuizit',
                // ),
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
                            quizPaperController.thirdAnswerControllerA.value,
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
                            quizPaperController.thirdAnswerControllerB.value,
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
                            quizPaperController.thirdAnswerControllerC.value,
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
                            quizPaperController.thirdAnswerControllerD.value,
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
                        'Krijo pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        quizPaperController.idOfQuestion++;
                        quizPaperController.saveQuestionId();
                        quizPaperController.createQuestion(
                          id: quizPaperController.idOfQuestion.toString(),
                          correctAnswer: quizPaperController
                              .thirdCorrectAnswer.value.text
                              .toUpperCase(),
                          question: quizPaperController
                              .thirdQuestionController.value.text,
                        );
                        quizPaperController.createAnswerA(
                            answer: quizPaperController
                                .thirdAnswerControllerA.value.text,
                            identifier: quizPaperController
                                        .thirdAnswerControllerA.value.text ==
                                    quizPaperController
                                        .thirdAnswerControllerA.value.text
                                ? 'A'
                                : 'j');
                        quizPaperController.createAnswerB(
                            answer: quizPaperController
                                .thirdAnswerControllerB.value.text,
                            identifier: quizPaperController
                                        .thirdAnswerControllerB.value.text ==
                                    quizPaperController
                                        .thirdAnswerControllerB.value.text
                                ? 'B'
                                : 'j');
                        quizPaperController.createAnswerC(
                            answer: quizPaperController
                                .thirdAnswerControllerC.value.text,
                            identifier: quizPaperController
                                        .thirdAnswerControllerC.value.text ==
                                    quizPaperController
                                        .thirdAnswerControllerC.value.text
                                ? 'C'
                                : 'j');
                        quizPaperController.createAnswerD(
                            answer: quizPaperController
                                .thirdAnswerControllerD.value.text,
                            identifier: quizPaperController
                                        .thirdAnswerControllerD.value.text ==
                                    quizPaperController
                                        .thirdAnswerControllerD.value.text
                                ? 'D'
                                : 'j');
                        // quizPaperController.createAnswers();
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
                      quizPaperController.fourthQuestionController.value,
                  hintText: 'Shkruaj pytjen e katert',
                  prefixText: '4:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      quizPaperController.fourthCorrectAnswer.value,
                  hintText: 'Cila eshte pergjigja e sakt',
                ),
                // TextFormFieldWidget(

                //   callBackClear: () {},
                //   callBackPrefix: () {},
                //   callBackSearch: () {},
                //   onChanged: (value) {},
                //   textEditingController:
                //       quizPaperController.idOfQuizController.value,
                //   hintText: 'Shkruaj id e kuizit',
                // ),
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
                            quizPaperController.fourthAnswerControllerA.value,
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
                            quizPaperController.fourthAnswerControllerB.value,
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
                            quizPaperController.fourthAnswerControllerC.value,
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
                            quizPaperController.fourthAnswerControllerD.value,
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
                        'Krijo pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        quizPaperController.idOfQuestion++;
                        quizPaperController.saveQuestionId();
                        quizPaperController.createQuestion(
                          id: quizPaperController.idOfQuestion.toString(),
                          correctAnswer: quizPaperController
                              .fourthCorrectAnswer.value.text
                              .toUpperCase(),
                          question: quizPaperController
                              .fourthQuestionController.value.text,
                        );
                        quizPaperController.createAnswerA(
                            answer: quizPaperController
                                .fourthAnswerControllerA.value.text,
                            identifier: quizPaperController
                                        .fourthAnswerControllerA.value.text ==
                                    quizPaperController
                                        .fourthAnswerControllerA.value.text
                                ? 'A'
                                : 'j');
                        quizPaperController.createAnswerB(
                            answer: quizPaperController
                                .fourthAnswerControllerB.value.text,
                            identifier: quizPaperController
                                        .fourthAnswerControllerB.value.text ==
                                    quizPaperController
                                        .fourthAnswerControllerB.value.text
                                ? 'B'
                                : 'j');
                        quizPaperController.createAnswerC(
                            answer: quizPaperController
                                .fourthAnswerControllerC.value.text,
                            identifier: quizPaperController
                                        .fourthAnswerControllerC.value.text ==
                                    quizPaperController
                                        .fourthAnswerControllerC.value.text
                                ? 'C'
                                : 'j');
                        quizPaperController.createAnswerD(
                            answer: quizPaperController
                                .fourthAnswerControllerD.value.text,
                            identifier: quizPaperController
                                        .fourthAnswerControllerD.value.text ==
                                    quizPaperController
                                        .fourthAnswerControllerD.value.text
                                ? 'D'
                                : 'j');
                        // quizPaperController.createAnswers();
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
                      quizPaperController.fifthQuestionController.value,
                  hintText: 'Shkruaj pytjen e peste',
                  prefixText: '5:',
                ),
                TextFormFieldWidget(
                  callBackClear: () {},
                  callBackPrefix: () {},
                  callBackSearch: () {},
                  onChanged: (value) {},
                  textEditingController:
                      quizPaperController.fifthCorrectAnswer.value,
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
                            quizPaperController.fifthAnswerControllerA.value,
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
                            quizPaperController.fifthAnswerControllerB.value,
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
                            quizPaperController.fifthAnswerControllerC.value,
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
                            quizPaperController.fifthAnswerControllerD.value,
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
                        'Krijo pytjen',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        quizPaperController.idOfQuestion++;
                        quizPaperController.saveQuestionId();
                        quizPaperController.createQuestion(
                          id: quizPaperController.idOfQuestion.toString(),
                          correctAnswer: quizPaperController
                              .fifthCorrectAnswer.value.text
                              .toUpperCase(),
                          question: quizPaperController
                              .fifthQuestionController.value.text,
                        );
                        quizPaperController.createAnswerA(
                            answer: quizPaperController
                                .fifthAnswerControllerA.value.text,
                            identifier: quizPaperController
                                        .fifthAnswerControllerA.value.text ==
                                    quizPaperController
                                        .fifthAnswerControllerA.value.text
                                ? 'A'
                                : 'j');
                        quizPaperController.createAnswerB(
                            answer: quizPaperController
                                .fifthAnswerControllerB.value.text,
                            identifier: quizPaperController
                                        .fifthAnswerControllerB.value.text ==
                                    quizPaperController
                                        .fifthAnswerControllerB.value.text
                                ? 'B'
                                : 'j');
                        quizPaperController.createAnswerC(
                            answer: quizPaperController
                                .fifthAnswerControllerC.value.text,
                            identifier: quizPaperController
                                        .fifthAnswerControllerC.value.text ==
                                    quizPaperController
                                        .fifthAnswerControllerC.value.text
                                ? 'C'
                                : 'j');
                        quizPaperController.createAnswerD(
                            answer: quizPaperController
                                .fifthAnswerControllerD.value.text,
                            identifier: quizPaperController
                                        .fifthAnswerControllerD.value.text ==
                                    quizPaperController
                                        .fifthAnswerControllerD.value.text
                                ? 'D'
                                : 'j');
                        // quizPaperController.createAnswers();
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
