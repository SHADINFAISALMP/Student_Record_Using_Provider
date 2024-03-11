import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

class AddstudentController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  // RxFile? image25 ="".obs;
  String imagepath = "";

  addImage(String image) {
    imagepath = image;
    notifyListeners();
  }

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();

  intialization() {
    imagepath = "";
    nameController.clear();
    classController.clear();
    guardianController.clear();
    mobileController.clear();
  }

  Future<void> addstudentclicked(context,AddstudentController addcontroller) async {
   
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
        imagex: addcontroller.imagepath,
      );
      await addstudent(stdData,context); // Use the correct function name addStudent.

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully added"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.of(context).pop();
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

  Future<void> getimage(ImageSource source,AddstudentController addstudentController) async {
     
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    addstudentController.addImage(image.path);
  }

  void addphoto(ctxr, context,AddstudentController provider) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          content: const Text('Choose Image From.......'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera,provider);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery,provider);
                Navigator.of(context).pop();
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
