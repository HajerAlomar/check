import 'package:alqgp/Src/Screens/Authorized/homeWrapper.dart';
import 'package:email_auth/email_auth.dart';
import 'package:get/get.dart';

class OTPemailController extends GetxController {
  // static OTPemailController get instance => Get.find();

  EmailAuth emailAuth = EmailAuth(sessionName: "ALQ verification code");

  Future<void> sendOTP(String email) async {
    print(email);
    await emailAuth.sendOtp(recipientMail: email, otpLength: 6);
    // var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    // isVerified ? Get.offAll(HomeWrapper()) : Get.back();
  }

  void validateOTP(String email, String code) {
    var isVerified = emailAuth.validateOtp(recipientMail: email, userOtp: code);
    isVerified ? Get.offAll(HomeWrapper()) : Get.back();
  }
}
