import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BMIConroller extends GetxController {
  // ignore: non_constant_identifier_names
  RxString Gender = "MALE".obs;
  RxInt weight = 12.obs;
  RxInt age = 12.obs;
  RxDouble height = 100.0.obs;
  RxString bmi = "".obs;
  RxDouble tempBMI = 0.0.obs;
  // ignore: non_constant_identifier_names
  RxString BMIstatus = "".obs;
  Rx<Color> colorStattus = Color(0xff246AFE).obs;

  void genderHandle(String gender) {
    Gender.value = gender;
  }

  void CalculatBMI() {
    var Hmeter = height / 100;
    tempBMI.value = weight / (Hmeter * Hmeter);
    bmi.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(bmi.value);
    findStatus();
    print(bmi);
  }

  void findStatus() {
    if (tempBMI.value < 18.5) {
      BMIstatus.value = "UnderWeight";
      colorStattus.value = Color(0xffFFB800);
    }
    if (tempBMI.value > 18.5 && tempBMI.value < 24.9) {
      BMIstatus.value = "Normal";
      colorStattus.value = Color(0xff00CA39);
    }
    if (tempBMI.value > 25.0 && tempBMI.value < 29.9) {
      BMIstatus.value = "OverWeight";
      colorStattus.value = Color(0xffFF5858);
    }
    if (tempBMI.value > 30.0 && tempBMI.value < 34.9) {
      BMIstatus.value = "OBESE";
      colorStattus.value = Color(0xffFF0000);
    }
    if (tempBMI.value > 35.0) {
      BMIstatus.value = "Extremely OBESE";

      colorStattus.value = Color(0xff000000);
    }
  }
}
