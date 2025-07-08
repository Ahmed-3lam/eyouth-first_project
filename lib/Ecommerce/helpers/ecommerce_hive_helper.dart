import 'package:hive/hive.dart';

class EcommerceHiveHelper {
  static const onboardingBox = "ONBOARDING_BOX";
  static const onboardingKey = "ONBOARDING_Key";
  static const token_box = "TOKEN_BOX";
  static const token_key = "token_key";

  static void setValueOnboardingBox() async {
    await Hive.box(onboardingBox).put(onboardingKey, true);
  }

  static void setToken(String token) async {
    await Hive.box(token_box).put(token_box, token);
  }

// static bool isOnboardingBoxIsEmpty() {
//   if (Hive.box(onboardingBox).isEmpty) {
//     return true;
//   } else {
//     return false;
//   }
// }
}
