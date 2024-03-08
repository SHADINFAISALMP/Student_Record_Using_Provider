import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

class Editcontroller extends GetxController {
  final formKey = GlobalKey<FormState>();
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

  Future<void> geterimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }

    editcontroller.updatedImagepath.value = image.path.toString();
  }

  Future<void> editstudentclicked(
      BuildContext context, StudentModel student) async {
    if (formKey.currentState!.validate()) {
      final name = editcontroller.editnameController.text.toUpperCase();
      final classA = editcontroller.editclassController.text.toString().trim();
      final father = editcontroller.editguardianController.text;
      final phonenumber = editcontroller.editmobileController.text.trim();

      final updatedStudent = StudentModel(
        id: student.id,
        name: name,
        classname: classA,
        father: father,
        pnumber: phonenumber,
        imagex: editcontroller.updatedImagepath.value,
      );

      await editStudent(
        student.id!,
        updatedStudent.name,
        updatedStudent.classname,
        updatedStudent.father,
        updatedStudent.pnumber,
        updatedStudent.imagex,
      );

      // Refresh the data in the StudentList widget.
      getstudentdata();

      Get.back();
    }
  }

  void editphoto(ctxr) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          title: const Text('Update Photo '),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    Text('Choose from camera'),
                    IconButton(
                      onPressed: () {
                        geterimage(ImageSource.camera);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Choose from gallery '),
                    IconButton(
                      onPressed: () {
                        geterimage(ImageSource.gallery);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.image,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

final editcontroller = Get.find<Editcontroller>();
