import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddstudentController extends GetxController {
  // RxFile? image25 ="".obs;
  RxString imagepath = "".obs;

  addImage(String image) {
    imagepath.value = image;
  }

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();

  intialization() {
    imagepath.value = "";
    nameController.clear();
    classController.clear();
    guardianController.clear();
    mobileController.clear();
  }
}
