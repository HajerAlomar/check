import 'package:alqgp/AR/AR.dart';
import 'package:alqgp/Src/Screens/Authorized/Quiz/quiz.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/chapter_controller.dart';
import 'package:alqgp/Src/Screens/Authorized/Chapters/widgets/chapterHeader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/chapterLessonCard.dart';

class Chaptercontent extends StatelessWidget {
  const Chaptercontent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChapterController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //*******scan and back

        body: SingleChildScrollView(
          child: Stack(
            children: [
              GetX<ChapterController>(
                init: Get.put<ChapterController>(ChapterController()),
                builder: (ChapterController chapterController) {
                  if (chapterController.lessons.isNotEmpty) {
                    return Column(
                      children: [
                        //******** fullscreen in 3D

                        // 3d model + lesson 0
                        lessonCardWithIndicatorAndModel(
                            size, chapterController.lessons, controller),
                        const SizedBox(height: tDefaultPadding),
                        const Divider(),

                        //header and boxes of organes
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: tDefaultScreenPadding),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(tChapterHeading1,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ),

                              //lesson card
                              lessonCardList(chapterController.lessons,
                                  controller.chapterContent.chapNum!),
                            ],
                          ),
                        ),

                        //quiz button
                        Container(
                          padding: const EdgeInsets.only(
                            left: tDefaultScreenPadding,
                            right: tDefaultScreenPadding,
                            // bottom: tDefaultScreenPadding
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              (controller.ar.value && controller.lesons.value)
                                  ? Get.to(() => quiz(),
                                      arguments:
                                          chapterController.chapterContent)
                                  : Get.defaultDialog(
                                      content: const Center(
                                      child: Text(
                                          "You have to use the AR and read all organs' information"),
                                    ));
                            },
                            style: controller.ar.value &&
                                    controller.lesons.value
                                ? ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  )
                                : ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    side: BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                            child: Text(tQuiz.toUpperCase()),
                          ),
                        ),
                      ],
                    );
                  } else {
                    //while loading data
                    return Container(
                        margin: EdgeInsets.only(top: size.height / 2),
                        child:
                            const Center(child: CircularProgressIndicator()));
                  }
                },
              ),

              // back button
              backButton(),

              // AR button
              Positioned(
                right: tDefaultPadding,
                top: tDefaultSize,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tCardRadius),
                    color: Colors.grey.shade300.withOpacity(0.33),
                  ),
                  height: 50,
                  width: 50,
                  child: IconButton(
                      onPressed: () {
                        controller.ar.value = true;
                        Get.to(() =>
                            AR(chaptNum: controller.chapterContent.chapNum!));
                      },
                      icon: Icon(Icons.view_in_ar)),
                ),
              ),

              // // down button
              // Positioned(
              //   right: tDefaultPadding,
              //   bottom: tDefaultSize + 20,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(tCardRadius),
              //       color: Colors.grey.shade300.withOpacity(0.33),
              //     ),
              //     height: 50,
              //     width: 50,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.arrow_drop_down_circle_outlined)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
