import 'package:get/get.dart';
import 'package:sqflite_10/controllerss/add_student_controller.dart';
import 'package:sqflite_10/controllerss/bottom_controller.dart';
import 'package:sqflite_10/controllerss/edit_controller.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';

class Intailization implements Bindings {
  @override
  void dependencies() {
    Get.put<AddstudentController>(AddstudentController());
    Get.put<Editcontroller>(Editcontroller());
    Get.put<StudentController>(StudentController());
    Get.put<BottomController>(BottomController());
  }
}
