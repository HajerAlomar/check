import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Positioned quizAppBar(
    Size size, BuildContext context, QuizController quizController) {
  return Positioned(
    top: size.height * 0.05,
    left: 0,
    right: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // timer
          Obx(
            () => Center(
                child: Text(quizController.time.value,
                    style: Theme.of(context).textTheme.headline5)),
          ),

          // qustion number
          Center(
            child: Text("Q ${quizController.questionNumber()}",
                style: Theme.of(context).textTheme.headline5),
          ),

          // hint icons
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    //increase timer
                    if (quizController.incremented != true) {
                      quizController.incrementTime();
                    } else {
                      Get.defaultDialog(
                          content: const Center(
                        child: Text("you already used this hint before"),
                      ));
                      quizController.startTimer2();
                    }
                  },
                  child: const Icon(Icons.av_timer_outlined, size: 30)),
              SizedBox(
                width: size.width * 0.02,
              ),
              GestureDetector(
                  onTap: () {
                    // delete 2 answers
                    if (quizController.deleted != true) {
                      quizController.delete.value = false;
                      quizController.deleted = true;
                      quizController.update();
                    } else {
                      Get.defaultDialog(
                          content: const Center(
                        child: Text("you already used this hint before"),
                      ));
                      quizController.startTimer2();
                    }
                  },
                  child: const Icon(Icons.delete_sweep_outlined, size: 30))
            ],
          )
        ],
      ),
    ),
  );
}
