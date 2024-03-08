import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

class AddstudentController extends GetxController {
  final formKey = GlobalKey<FormState>();
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

  Future<void> addstudentclicked(context) async {
    if (formKey.currentState!.validate() &&
        addcontroller.imagepath.isNotEmpty) {
      final name = addcontroller.nameController.text.toUpperCase();
      final classA = addcontroller.classController.text.toString().trim();
      final father = addcontroller.guardianController.text;
      final phonenumber = addcontroller.mobileController.text.trim();

      final stdData = StudentModel(
        name: name,
        classname: classA,
        father: father,
        pnumber: phonenumber,
        imagex: addcontroller.imagepath.value,
      );
      await addstudent(stdData); // Use the correct function name addStudent.

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully added"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 2),
        ),
      );

      Get.back();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add Profile Picture '),
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
   Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    addcontroller.addImage(image.path);
  }

  void addphoto(ctxr, context) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          content: const Text('Choose Image From.......'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera);
                Get.back();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery);
                 Get.back();
              },
              icon: const Icon(
                Icons.image,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}

final addcontroller = Get.find<AddstudentController>();
