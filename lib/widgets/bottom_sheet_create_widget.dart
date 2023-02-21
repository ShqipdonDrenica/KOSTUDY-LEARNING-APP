import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/create_quiz_controller.dart';
import 'package:flutter_study_app/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

import '../models/question_paper_model.dart';

// ignore: must_be_immutable
class BottomSheetCreateWidget extends StatefulWidget {
  BottomSheetCreateWidget({super.key, this.quiz});

  QuestionPaperModel? quiz;

  @override
  State<BottomSheetCreateWidget> createState() =>
      _BottomSheetCreateWidgetState();
}

class _BottomSheetCreateWidgetState extends State<BottomSheetCreateWidget> {
  final createQuizController =
      Get.put<CreateQuizController>(CreateQuizController());
  @override
  Widget build(BuildContext context) {
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
                Form(
                  key: createQuizController.createQuizFormKey.value,
                  child: Column(
                    children: [
                      const Text(
                        'Plotesoni te dhenat per kuizin',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700),
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
                            createQuizController.titleQuizController.value,
                        hintText: 'Titulli i kuizit',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Titulli nuk mund te jete i zbrazet';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController: createQuizController
                            .descriptionQuizController.value,
                        hintText: 'Pershkrimi i kuizit',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Pershkrimi nuk mund te jete i zbrazet';
                          }
                        },
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
                            createQuizController.imageQuizController.value,
                        hintText: 'Foto e kuizit',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Foto nuk mund te jete zbrazet';
                          }
                        },
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
                            createQuizController.timeQuizController.value,
                        hintText: 'Koha caktuar e kuizit (ne sekonda)',
                        validator: (value) {
                          if (value.isEmpty ||
                              !createQuizController.nrRegExp.hasMatch(value)) {
                            return 'koha nuk mund te jete e zbrazet, te permbaj vetem nr';
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                top: 20,
                                bottom: 40,
                              ),
                              width:
                                  createQuizController.createdQuiz.value == true
                                      ? 150
                                      : 110,
                              height: 50,
                              decoration: BoxDecoration(
                                color: createQuizController.createdQuiz.value ==
                                        true
                                    ? Colors.green
                                    : Get.theme.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                child: Text(
                                  createQuizController.createdQuiz.value ==
                                          false
                                      ? 'Krijo kuizin'
                                      : 'Kuizi eshte krijuar',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (createQuizController.createdQuiz.value ==
                                      false) {
                                    createQuizController.submit();
                                    createQuizController.idOfQuiz++;
                                    createQuizController.saveID();
                                    createQuizController.createQuiz(
                                      description: createQuizController
                                          .descriptionQuizController.value.text,
                                      id: createQuizController.idOfQuiz
                                          .toString(),
                                      imageUrl: createQuizController
                                          .imageQuizController.value.text,
                                      questionCount: 5,
                                      timeSeconds: int.parse(
                                          createQuizController
                                              .timeQuizController.value.text),
                                      title: createQuizController
                                          .titleQuizController.value.text,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Plotesoni pyetjet per kuizin',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),

                //first question
                Form(
                  key: createQuizController.createQuestion1FormKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            createQuizController.firstQuestionController.value,
                        hintText: 'Shkruaj pytjen e pare',
                        prefixText: '1:',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Pyetja nuk mund te jete i zbrazet';
                          }
                        },
                      ),
                      TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            createQuizController.firstCorrectAnswer.value,
                        hintText: 'Cila eshte pergjigja e sakt',
                        validator: (value) {
                          if (value.isEmpty || value.length != 1) {
                            return 'Pergjigja e sakt nuk mund te jete i zbrazet, dhe duhet te permbaj vetem 1';
                          }
                        },
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
                              textEditingController: createQuizController
                                  .firstAnswerControllerA.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'A:',
                              validator: (value) {},
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
                              textEditingController: createQuizController
                                  .firstAnswerControllerB.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'B:',
                              validator: (value) {},
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
                              textEditingController: createQuizController
                                  .firstAnswerControllerC.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'C:',
                              validator: (value) {},
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
                              textEditingController: createQuizController
                                  .firstAnswerControllerD.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'D:',
                              validator: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            bottom: 40,
                          ),
                          width: createQuizController.firstQuestionCreated.value
                              ? 150
                              : 110,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                createQuizController.firstQuestionCreated.value
                                    ? Colors.green
                                    : Get.theme.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            child: Text(
                              createQuizController.firstQuestionCreated.value
                                  ? 'Pyetja eshte krijuar'
                                  : 'Krijo pytjen',
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (createQuizController
                                      .firstQuestionCreated.value ==
                                  false) {
                                createQuizController.submitQuestion1();
                                createQuizController.idOfQuestion++;
                                createQuizController.saveQuestionId();
                                createQuizController.createQuestion(
                                  id: createQuizController.idOfQuestion
                                      .toString(),
                                  correctAnswer: createQuizController
                                      .firstCorrectAnswer.value.text
                                      .toUpperCase(),
                                  question: createQuizController
                                      .firstQuestionController.value.text,
                                );
                                createQuizController.createAnswerA(
                                    answer: createQuizController
                                        .firstAnswerControllerA.value.text,
                                    identifier: createQuizController
                                                .firstAnswerControllerA
                                                .value
                                                .text ==
                                            createQuizController
                                                .firstAnswerControllerA
                                                .value
                                                .text
                                        ? 'A'
                                        : 'j');
                                createQuizController.createAnswerB(
                                    answer: createQuizController
                                        .firstAnswerControllerB.value.text,
                                    identifier: createQuizController
                                                .firstAnswerControllerB
                                                .value
                                                .text ==
                                            createQuizController
                                                .firstAnswerControllerB
                                                .value
                                                .text
                                        ? 'B'
                                        : 'j');
                                createQuizController.createAnswerC(
                                    answer: createQuizController
                                        .firstAnswerControllerC.value.text,
                                    identifier: createQuizController
                                                .firstAnswerControllerC
                                                .value
                                                .text ==
                                            createQuizController
                                                .firstAnswerControllerC
                                                .value
                                                .text
                                        ? 'C'
                                        : 'j');
                                createQuizController.createAnswerD(
                                    answer: createQuizController
                                        .firstAnswerControllerD.value.text,
                                    identifier: createQuizController
                                                .firstAnswerControllerD
                                                .value
                                                .text ==
                                            createQuizController
                                                .firstAnswerControllerD
                                                .value
                                                .text
                                        ? 'D'
                                        : 'j');
                              }
                            },
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: createQuizController.createQuestion2FormKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            createQuizController.secondQuestionController.value,
                        hintText: 'Shkruaj pyetjen e dyt',
                        prefixText: '2:',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Pyetja nuk mund te jete i zbrazet';
                          }
                        },
                      ),
                      TextFormFieldWidget(
                        callBackClear: () {},
                        callBackPrefix: () {},
                        callBackSearch: () {},
                        onChanged: (value) {},
                        textEditingController:
                            createQuizController.secondCorrectAnswer.value,
                        hintText: 'Cila eshte pergjigja e sakt',
                        validator: (value) {
                          if (value.isEmpty || value.length != 1) {
                            return 'Pergjigja e sakt nuk mund te jete i zbrazet, dhe duhet te permbaj vetem 1';
                          }
                        },
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
                              textEditingController: createQuizController
                                  .secondAnswerControllerA.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'A:',
                              validator: (value) {},
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
                              textEditingController: createQuizController
                                  .secondAnswerControllerB.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'B:',
                              validator: (value) {},
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
                              textEditingController: createQuizController
                                  .secondAnswerControllerC.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'C:',
                              validator: (value) {},
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
                              textEditingController: createQuizController
                                  .secondAnswerControllerD.value,
                              hintText: 'Shkruaj pergjigjen',
                              prefixText: 'D:',
                              validator: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            bottom: 40,
                          ),
                          width:
                              createQuizController.secondQuestionCreated.value
                                  ? 150
                                  : 110,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                createQuizController.secondQuestionCreated.value
                                    ? Colors.green
                                    : Get.theme.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            child: Text(
                              createQuizController.secondQuestionCreated.value
                                  ? 'Pyetja eshte krijuar'
                                  : 'Krijo pytjen',
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (createQuizController
                                      .secondQuestionCreated.value ==
                                  false) {
                                createQuizController.submitQuestion2();
                                createQuizController.idOfQuestion++;
                                createQuizController.saveQuestionId();
                                createQuizController.createQuestion(
                                  id: createQuizController.idOfQuestion
                                      .toString(),
                                  correctAnswer: createQuizController
                                      .secondCorrectAnswer.value.text
                                      .toUpperCase(),
                                  question: createQuizController
                                      .secondQuestionController.value.text,
                                );
                                createQuizController.createAnswerA(
                                    answer: createQuizController
                                        .secondAnswerControllerA.value.text,
                                    identifier: createQuizController
                                                .secondAnswerControllerA
                                                .value
                                                .text ==
                                            createQuizController
                                                .secondAnswerControllerA
                                                .value
                                                .text
                                        ? 'A'
                                        : 'j');
                                createQuizController.createAnswerB(
                                    answer: createQuizController
                                        .secondAnswerControllerB.value.text,
                                    identifier: createQuizController
                                                .secondAnswerControllerB
                                                .value
                                                .text ==
                                            createQuizController
                                                .secondAnswerControllerB
                                                .value
                                                .text
                                        ? 'B'
                                        : 'j');
                                createQuizController.createAnswerC(
                                    answer: createQuizController
                                        .secondAnswerControllerC.value.text,
                                    identifier: createQuizController
                                                .secondAnswerControllerC
                                                .value
                                                .text ==
                                            createQuizController
                                                .secondAnswerControllerC
                                                .value
                                                .text
                                        ? 'C'
                                        : 'j');
                                createQuizController.createAnswerD(
                                    answer: createQuizController
                                        .secondAnswerControllerD.value.text,
                                    identifier: createQuizController
                                                .secondAnswerControllerD
                                                .value
                                                .text ==
                                            createQuizController
                                                .secondAnswerControllerD
                                                .value
                                                .text
                                        ? 'D'
                                        : 'j');
                              }
                            },
                          )),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: createQuizController.createQuestion3FormKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormFieldWidget(
                          callBackClear: () {},
                          callBackPrefix: () {},
                          callBackSearch: () {},
                          onChanged: (value) {},
                          textEditingController: createQuizController
                              .thirdQuestionController.value,
                          hintText: 'Shkruaj pytjen e tret',
                          prefixText: '3:',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Pyetja nuk mund te jete i zbrazet';
                            }
                          },
                        ),
                        TextFormFieldWidget(
                          callBackClear: () {},
                          callBackPrefix: () {},
                          callBackSearch: () {},
                          onChanged: (value) {},
                          textEditingController:
                              createQuizController.thirdCorrectAnswer.value,
                          hintText: 'Cila eshte pergjigja e sakt',
                          validator: (value) {
                            if (value.isEmpty || value.length != 1) {
                              return 'Pergjigja e sakt nuk mund te jete i zbrazet, dhe duhet te permbaj vetem 1';
                            }
                          },
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
                                textEditingController: createQuizController
                                    .thirdAnswerControllerA.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'A:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .thirdAnswerControllerB.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'B:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .thirdAnswerControllerC.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'C:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .thirdAnswerControllerD.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'D:',
                                validator: (value) {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              bottom: 40,
                            ),
                            width:
                                createQuizController.thirdQuestionCreated.value
                                    ? 150
                                    : 110,
                            height: 50,
                            decoration: BoxDecoration(
                              color: createQuizController
                                      .thirdQuestionCreated.value
                                  ? Colors.green
                                  : Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              child: Text(
                                createQuizController.thirdQuestionCreated.value
                                    ? 'Pyetja eshte krijuar'
                                    : 'Krijo pytjen',
                                style: const TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (createQuizController
                                        .thirdQuestionCreated.value ==
                                    false) {
                                  createQuizController.submitQuestion3();
                                  createQuizController.idOfQuestion++;
                                  createQuizController.saveQuestionId();
                                  createQuizController.createQuestion(
                                    id: createQuizController.idOfQuestion
                                        .toString(),
                                    correctAnswer: createQuizController
                                        .thirdCorrectAnswer.value.text
                                        .toUpperCase(),
                                    question: createQuizController
                                        .thirdQuestionController.value.text,
                                  );
                                  createQuizController.createAnswerA(
                                      answer: createQuizController
                                          .thirdAnswerControllerA.value.text,
                                      identifier: createQuizController
                                                  .thirdAnswerControllerA
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .thirdAnswerControllerA
                                                  .value
                                                  .text
                                          ? 'A'
                                          : 'j');
                                  createQuizController.createAnswerB(
                                      answer: createQuizController
                                          .thirdAnswerControllerB.value.text,
                                      identifier: createQuizController
                                                  .thirdAnswerControllerB
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .thirdAnswerControllerB
                                                  .value
                                                  .text
                                          ? 'B'
                                          : 'j');
                                  createQuizController.createAnswerC(
                                      answer: createQuizController
                                          .thirdAnswerControllerC.value.text,
                                      identifier: createQuizController
                                                  .thirdAnswerControllerC
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .thirdAnswerControllerC
                                                  .value
                                                  .text
                                          ? 'C'
                                          : 'j');
                                  createQuizController.createAnswerD(
                                      answer: createQuizController
                                          .thirdAnswerControllerD.value.text,
                                      identifier: createQuizController
                                                  .thirdAnswerControllerD
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .thirdAnswerControllerD
                                                  .value
                                                  .text
                                          ? 'D'
                                          : 'j');
                                }
                              },
                            )),
                      ],
                    )),

                const SizedBox(
                  height: 20,
                ),

                Form(
                    key: createQuizController.createQuestion4FormKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormFieldWidget(
                          callBackClear: () {},
                          callBackPrefix: () {},
                          callBackSearch: () {},
                          onChanged: (value) {},
                          textEditingController: createQuizController
                              .fourthQuestionController.value,
                          hintText: 'Shkruaj pytjen e katert',
                          prefixText: '4:',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Pyetja nuk mund te jete i zbrazet';
                            }
                          },
                        ),
                        TextFormFieldWidget(
                          callBackClear: () {},
                          callBackPrefix: () {},
                          callBackSearch: () {},
                          onChanged: (value) {},
                          textEditingController:
                              createQuizController.fourthCorrectAnswer.value,
                          hintText: 'Cila eshte pergjigja e sakt',
                          validator: (value) {
                            if (value.isEmpty || value.length != 1) {
                              return 'Pergjigja e sakt nuk mund te jete i zbrazet, dhe duhet te permbaj vetem 1';
                            }
                          },
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
                                textEditingController: createQuizController
                                    .fourthAnswerControllerA.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'A:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .fourthAnswerControllerB.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'B:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .fourthAnswerControllerC.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'C:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .fourthAnswerControllerD.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'D:',
                                validator: (value) {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              bottom: 40,
                            ),
                            width:
                                createQuizController.fourthQuestionCreated.value
                                    ? 150
                                    : 110,
                            height: 50,
                            decoration: BoxDecoration(
                              color: createQuizController
                                      .fourthQuestionCreated.value
                                  ? Colors.green
                                  : Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              child: Text(
                                createQuizController.fourthQuestionCreated.value
                                    ? 'Pyetja eshte krijuar'
                                    : 'Krijo pytjen',
                                style: const TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (createQuizController
                                        .fourthQuestionCreated.value ==
                                    false) {
                                  createQuizController.submitQuestion4();
                                  createQuizController.idOfQuestion++;
                                  createQuizController.saveQuestionId();
                                  createQuizController.createQuestion(
                                    id: createQuizController.idOfQuestion
                                        .toString(),
                                    correctAnswer: createQuizController
                                        .fourthCorrectAnswer.value.text
                                        .toUpperCase(),
                                    question: createQuizController
                                        .fourthQuestionController.value.text,
                                  );
                                  createQuizController.createAnswerA(
                                      answer: createQuizController
                                          .fourthAnswerControllerA.value.text,
                                      identifier: createQuizController
                                                  .fourthAnswerControllerA
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fourthAnswerControllerA
                                                  .value
                                                  .text
                                          ? 'A'
                                          : 'j');
                                  createQuizController.createAnswerB(
                                      answer: createQuizController
                                          .fourthAnswerControllerB.value.text,
                                      identifier: createQuizController
                                                  .fourthAnswerControllerB
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fourthAnswerControllerB
                                                  .value
                                                  .text
                                          ? 'B'
                                          : 'j');
                                  createQuizController.createAnswerC(
                                      answer: createQuizController
                                          .fourthAnswerControllerC.value.text,
                                      identifier: createQuizController
                                                  .fourthAnswerControllerC
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fourthAnswerControllerC
                                                  .value
                                                  .text
                                          ? 'C'
                                          : 'j');
                                  createQuizController.createAnswerD(
                                      answer: createQuizController
                                          .fourthAnswerControllerD.value.text,
                                      identifier: createQuizController
                                                  .fourthAnswerControllerD
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fourthAnswerControllerD
                                                  .value
                                                  .text
                                          ? 'D'
                                          : 'j');
                                }
                              },
                            )),
                      ],
                    )),

                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: createQuizController.createQuestion5FormKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormFieldWidget(
                          callBackClear: () {},
                          callBackPrefix: () {},
                          callBackSearch: () {},
                          onChanged: (value) {},
                          textEditingController: createQuizController
                              .fifthQuestionController.value,
                          hintText: 'Shkruaj pytjen e peste',
                          prefixText: '5:',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Pyetja nuk mund te jete i zbrazet';
                            }
                          },
                        ),
                        TextFormFieldWidget(
                          callBackClear: () {},
                          callBackPrefix: () {},
                          callBackSearch: () {},
                          onChanged: (value) {},
                          textEditingController:
                              createQuizController.fifthCorrectAnswer.value,
                          hintText: 'Cila eshte pergjigja e sakt',
                          validator: (value) {
                            if (value.isEmpty || value.length != 1) {
                              return 'Pergjigja e sakt nuk mund te jete i zbrazet, dhe duhet te permbaj vetem 1';
                            }
                          },
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
                                textEditingController: createQuizController
                                    .fifthAnswerControllerA.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'A:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .fifthAnswerControllerB.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'B:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .fifthAnswerControllerC.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'C:',
                                validator: (value) {},
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
                                textEditingController: createQuizController
                                    .fifthAnswerControllerD.value,
                                hintText: 'Shkruaj pergjigjen',
                                prefixText: 'D:',
                                validator: (value) {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              bottom: 40,
                            ),
                            width:
                                createQuizController.fifthQuestionCreated.value
                                    ? 150
                                    : 110,
                            height: 50,
                            decoration: BoxDecoration(
                              color: createQuizController
                                      .fifthQuestionCreated.value
                                  ? Colors.green
                                  : Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              child: Text(
                                createQuizController.fifthQuestionCreated.value
                                    ? 'Pyetja eshte krijuar'
                                    : 'Krijo pytjen',
                                style: const TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (createQuizController
                                        .fifthQuestionCreated.value ==
                                    false) {
                                  createQuizController.submitQuestion5();
                                  createQuizController.idOfQuestion++;
                                  createQuizController.saveQuestionId();
                                  createQuizController.createQuestion(
                                    id: createQuizController.idOfQuestion
                                        .toString(),
                                    correctAnswer: createQuizController
                                        .fifthCorrectAnswer.value.text
                                        .toUpperCase(),
                                    question: createQuizController
                                        .fifthQuestionController.value.text,
                                  );
                                  createQuizController.createAnswerA(
                                      answer: createQuizController
                                          .fifthAnswerControllerA.value.text,
                                      identifier: createQuizController
                                                  .fifthAnswerControllerA
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fifthAnswerControllerA
                                                  .value
                                                  .text
                                          ? 'A'
                                          : 'j');
                                  createQuizController.createAnswerB(
                                      answer: createQuizController
                                          .fifthAnswerControllerB.value.text,
                                      identifier: createQuizController
                                                  .fifthAnswerControllerB
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fifthAnswerControllerB
                                                  .value
                                                  .text
                                          ? 'B'
                                          : 'j');
                                  createQuizController.createAnswerC(
                                      answer: createQuizController
                                          .fifthAnswerControllerC.value.text,
                                      identifier: createQuizController
                                                  .fifthAnswerControllerC
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fifthAnswerControllerC
                                                  .value
                                                  .text
                                          ? 'C'
                                          : 'j');
                                  createQuizController.createAnswerD(
                                      answer: createQuizController
                                          .fifthAnswerControllerD.value.text,
                                      identifier: createQuizController
                                                  .fifthAnswerControllerD
                                                  .value
                                                  .text ==
                                              createQuizController
                                                  .fifthAnswerControllerD
                                                  .value
                                                  .text
                                          ? 'D'
                                          : 'j');
                                }
                              },
                            )),
                      ],
                    )),
                Center(
                  child: createQuizController.allQuizPaperCreated.value
                      ? const Text(
                          'Duhet plotesuar te gjitha te dhenat per kuizin ',
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                      onPressed: () {
                        if (createQuizController.firstQuestionCreated.value &&
                            createQuizController.secondQuestionCreated.value &&
                            createQuizController.thirdQuestionCreated.value &&
                            createQuizController.fourthQuestionCreated.value &&
                            createQuizController.fifthQuestionCreated.value) {
                          createQuizController.navigateToHomePage();
                        } else {
                          createQuizController.allQuizPaperCreated.value = true;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Perfundo',
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
            )),
          ),
        ),
      ),
    );
  }
}
