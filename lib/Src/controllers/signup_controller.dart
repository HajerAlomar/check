import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Screens/Authenticate/ForgotPassword/forgotPass_OTP.dart';
import 'package:alqgp/Src/Screens/Authenticate/ForgotPassword/forgotPass_button_seet.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final authRepo = Get.put(AuthenticationRepository());

  RxBool notshowpass = true.obs;

  changeShow() {
    notshowpass.value = !notshowpass.value;
  }

  //Get phone No from user and pass it to Auth Repository for Firebase Authentication
  Future<void> createUser(UserModel user, String password) async {
    bool state = await authRepo.createUserWithEmailAndPassword(
        user.email!, password, user);
    if (state) {
      ForgetPasswordScreen.buildShowModalBottomSheet(
          Get.context, phoneNo.text, email.text);
      // AuthenticationRepository.instance.phoneAuthentication(phoneNo.text);
      // Get.to(() => OTPScreen(phone: phoneNo.text));
    } else {
      Get.back();
    }

    //*************** fix phone auth  */
    // ? phoneAuthentication(user.phoneNo!)
    // ? AuthenticationRepository.instance.phoneAuthentication(phoneNo.text)
    //         as bool
    //     ? Get.to(() => OTPScreen(phone: phoneNo.text))
    //     : Get.back()
    // : Get.back();
  }

  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication
  // bool phoneAuthentication(String phoneNo) {
  //   bool state =
  //       AuthenticationRepository.instance.phoneAuthentication(phoneNo) as bool;

  //   return state;
  // }
}
