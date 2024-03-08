import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Editcontroller extends GetxController {
  RxString updatedImagepath = "".obs;
  final editnameController = TextEditingController();
  final editclassController = TextEditingController();
  final editguardianController = TextEditingController();
  final editmobileController = TextEditingController();
  addImage(String image) {
    updatedImagepath.value = image;
  }

  void initialValues({
    required String imagePaths,
    required String name,
    required String classname,
    required String quardianname,
    required String mobilename,
  }) {
    updatedImagepath.value = imagePaths;
    editnameController.text = name;
    editclassController.text = classname;
    editguardianController.text = quardianname;
    editmobileController.text = mobilename;
  }
}
