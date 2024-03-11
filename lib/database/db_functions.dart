// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, avoid_print, unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls


import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';
import 'package:sqflite_10/database/db_model.dart';

late Database _db;
Future<void> initializeDatabase() async {
  _db = await openDatabase(
    'student_db',
    version: 1,
    onCreate: (Database db, version) async {
      await db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, classname TEXT, father TEXT, pnumber TEXT, imagex TEXT)');
    },
  );
  print("Database created successfully.");
}

Future<List<StudentModel>> getstudentdata() async {
  final result = await _db.rawQuery("SELECT * FROM student");
  print('All Students data : ${result}');

  List<StudentModel> l1 = [];
  result.forEach((map) {
    final student = StudentModel.fromMap(map);
    l1.add(student);
  });
  return l1;
}

Future<void> addstudent(StudentModel value , context) async {
  try {
    await _db.rawInsert(
      'INSERT INTO student(name,classname,father,pnumber,imagex) VALUES(?,?,?,?,?)',
      [value.name, value.classname, value.father, value.pnumber, value.imagex],
    );
    getstudentdata();
   await Provider.of<StudentController>(context).initialize();
  } catch (e) {
    print('Error inserting data: $e');
  }
}

Future<void> deleteStudent(id,context) async {
  await _db.delete('student', where: 'id=?', whereArgs: [id]);
  getstudentdata();
  await Provider.of<StudentController>(context).initialize();
}

Future<void> editStudent(id, name, classname, father, pnumber, imagex ,context) async {
  final dataflow = {
    'name': name,
    'classname': classname,
    'father': father,
    'pnumber': pnumber,
    'imagex': imagex,
  };
  await _db.update('student', dataflow, where: 'id=?', whereArgs: [id]);
  getstudentdata();
 await Provider.of<StudentController>(context).initialize();
}
