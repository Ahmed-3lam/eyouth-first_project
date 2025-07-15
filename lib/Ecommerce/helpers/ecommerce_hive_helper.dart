import 'package:hive/hive.dart';

class EcommerceHiveHelper {
  static const onboardingBox = "ONBOARDING_BOX";
  static const onboardingKey = "ONBOARDING_Key";
  static const token_box = "TOKEN_BOX";

  static void setValueOnboardingBox() async {
    await Hive.box(onboardingBox).put(onboardingKey, true);
  }

  static void setToken(String token) async {
    await Hive.box(token_box).put(token_box, token);
  }

  static String getToken() {
    if (Hive.box(token_box).isNotEmpty) {
      return Hive.box(token_box).get(
        token_box,
      );
    } else {
      return "";
    }
  }

// static bool isOnboardingBoxIsEmpty() {
//   if (Hive.box(onboardingBox).isEmpty) {
//     return true;
//   } else {
//     return false;
//   }
// }
}

/// Localization
/// Firebase
/// Apis
/// Github
