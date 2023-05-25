import 'package:alqgp/Src/Screens/Authorized/Home/homeHeader.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/chapterProgressList.dart';
import 'Widgets/AchievementsWithHeader.dart';
import 'Widgets/userAvatarAndName.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //the name and the welcome
                HomePageHeader(controller),
                SizedBox(height: tDefaultPadding),

                // chapter cards
                ChapterProgressList(),
                SizedBox(height: tDefaultSpacing),

                //the user's ans thier names
                PeerRankWithAvatarAndName(),
                SizedBox(height: tDefaultSpacing),

                // achive
                AchievementsWithHeader()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
