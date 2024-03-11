import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

class Editcontroller extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String updatedImagepath = "";
  final editnameController = TextEditingController();
  final editclassController = TextEditingController();
  final editguardianController = TextEditingController();
  final editmobileController = TextEditingController();
  addImage(String image) {
    updatedImagepath = image;
    notifyListeners();
  }

  void initialValues({
    required String imagePaths,
    required String name,
    required String classname,
    required String quardianname,
    required String mobilename,
  }) {
    updatedImagepath = imagePaths;
    editnameController.text = name;
    editclassController.text = classname;
    editguardianController.text = quardianname;
    editmobileController.text = mobilename;
  }

  Future<void> geterimage(
      ImageSource source, Editcontroller editcontroller) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    editcontroller.addImage(image.path);
  }

  Future<void> editstudentclicked(BuildContext context, StudentModel student,
      Editcontroller editcontroller) async {
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
        imagex: editcontroller.updatedImagepath,
      );
  Navigator.of(context).pop();
      await editStudent(
          updatedStudent.id!,
          updatedStudent.name,
          updatedStudent.classname,
          updatedStudent.father,
          updatedStudent.pnumber,
          updatedStudent.imagex,
          context);
   
      // Refresh the data in the StudentList widget.
      //   await getstudentdata();
    
    }
  }

  void editphoto(ctxr, Editcontroller editStudent) {
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
                        geterimage(ImageSource.camera, editStudent);
                        Navigator.of(ctxr).pop();
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
                        geterimage(ImageSource.gallery, editStudent);
                        Navigator.of(ctxr).pop();
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
