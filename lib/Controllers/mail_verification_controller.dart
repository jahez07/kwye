import 'package:get/get.dart';
import 'package:kwye/Repository/Authentication/authentication_repository.dart';

class MailVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
  }

  Future<void> sendEmailVerification() async {
    await AuthenticationRepository.instance.sendEmailVerification();
  }

  void setTimerForAutoRedirect() {}

  void manuallyCheckEmailVerificationStatus() {}
}
