import 'package:hive/hive.dart';

class EcommerceHiveHelper {
  static const onboardingBox = "ONBOARDING_BOX";
  static const onboardingKey = "ONBOARDING_Key";

  static void setValueOnboardingBox() async {
    await Hive.box(onboardingBox).put(onboardingKey, true);
  }

// static bool isOnboardingBoxIsEmpty() {
//   if (Hive.box(onboardingBox).isEmpty) {
//     return true;
//   } else {
//     return false;
//   }
// }
}
