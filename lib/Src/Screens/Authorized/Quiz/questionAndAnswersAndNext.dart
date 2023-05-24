import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container questionAndAnswersAndNext(
    Size size, QuizController quizController, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: size.height * 0.15),
    height: size.height * 0.85,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(tCardRadius),
          topRight: Radius.circular(tCardRadius)),
      color: tCardBgColor,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
      child: Column(
        children: [
          // the question
          Padding(
            padding: const EdgeInsets.symmetric(vertical: tDefaultSpacing),
            child: Text(
                quizController
                    .questions[quizController.currentQuestionIndex.value]
                    .question!,
                style: Theme.of(context).textTheme.headline5),
          ),

          // answers cards
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: quizController.getlength(quizController.delete.value),
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: tDefaultPadding),
                    child: GestureDetector(
                      onTap: () {
                        quizController.setSelectedAnswer(index);
                      },
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(tDefaultPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(tCardRadius),
                            color: quizController.answers[quizController
                                        .currentQuestionIndex.value] ==
                                    index
                                ? Color.fromARGB(
                                    255, 251, 213, 100) // ****** change colore
                                : tPrimaryColor,
                          ),
                          child: Text(
                            quizController.delete.value
                                ? quizController
                                    .questions[quizController
                                        .currentQuestionIndex.value]
                                    .answers![index]
                                : quizController
                                    .questions[quizController
                                        .currentQuestionIndex.value]
                                    .answers![quizController.indexs[index]],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),

          // next button
          Container(
            padding: const EdgeInsets.only(bottom: tDefaultScreenPadding),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // shuffling the answers to get a arondom answers order each time
                quizController
                    .questions[quizController.currentQuestionIndex.value + 1]
                    .answers!
                    .shuffle();
                //if the answer is correct
                if (!quizController.deleted) {
                  if (quizController
                          .questions[quizController.currentQuestionIndex.value]
                          .answers![quizController
                              .selectedAnswers[
                          quizController.currentQuestionIndex.value]] ==
                      quizController
                          .questions[quizController.currentQuestionIndex.value]
                          .correct) {
                    quizController.isCorrect(1);
                    print(
                        "the choosen ans ${quizController.questions[quizController.currentQuestionIndex.value].answers![quizController.selectedAnswers[quizController.currentQuestionIndex.value]]}");
                    print(
                        "the correct ans ${quizController.questions[quizController.currentQuestionIndex.value].correct}");
                  } else {
                    quizController.isCorrect(0);
                    print(
                        "the choosen ans ${quizController.questions[quizController.currentQuestionIndex.value].answers![quizController.selectedAnswers[quizController.currentQuestionIndex.value]]}");
                    print(
                        "the correct ans ${quizController.questions[quizController.currentQuestionIndex.value].correct}");
                  }
                  quizController.next();
                } else {
                  //************* needa change cos the ans is based on the answers arr not the new arr */
                  if (quizController
                          .questions[quizController.currentQuestionIndex.value]
                          .answers![quizController
                              .selectedAnswers[
                          quizController.currentQuestionIndex.value]] ==
                      quizController
                          .questions[quizController.currentQuestionIndex.value]
                          .correct) {
                    quizController.isCorrect(1);
                    print(
                        "the choosen in deleted ans ${quizController.questions[quizController.currentQuestionIndex.value].answers![quizController.selectedAnswers[quizController.currentQuestionIndex.value]]}");
                    print(
                        "the correct in deleted ans ${quizController.questions[quizController.currentQuestionIndex.value].correct}");
                  } else {
                    quizController.isCorrect(0);
                    print(
                        "the choosen ans ${quizController.questions[quizController.currentQuestionIndex.value].answers![quizController.selectedAnswers[quizController.currentQuestionIndex.value]]}");
                    print(
                        "the correct ans ${quizController.questions[quizController.currentQuestionIndex.value].correct}");
                  }
                  quizController.next();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(quizController.currentQuestionIndex.value >=
                      quizController.questions.length - 2
                  ? "Complete".toUpperCase()
                  : tNext.toUpperCase()),
            ),
          ),
        ],
      ),
    ),
  );
}
