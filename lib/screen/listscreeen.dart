// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

import 'package:sqflite_10/screen/editstudent.dart';
import 'package:sqflite_10/screen/studentdetails.dart';

class StudentList extends StatelessWidget {
   const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    studentController.initialize();
    return Obx(
      ()=> ListView.builder(
        itemCount: studentController.studentLists.length,
        itemBuilder: (context, index) {
          final student = studentController.studentLists[index];
      
          return Card(
            margin: const EdgeInsets.all(13),
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(
                  File(student.imagex),
                ),
              ),
              title: Text(
                student.name,
              ),
              subtitle: Text(
                "Class: ${student.classname}",
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Get.to(() => EditStudent(student: student),
                          transition: Transition.cupertinoDialog);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      deletestudent(context, student);
                    },
                  ),
                ],
              ),
              onTap: () {
                Get.to(
                    () => StudentDetails(
                          stdetails: student,
                        ),
                    transition: Transition.circularReveal);
              },
            ),
          );
        },
      ),
    );
  }

  void deletestudent(rtx, StudentModel student) {
    showDialog(
      context: rtx,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Do You Want delete Name ?'),
          actions: [
            TextButton(
              onPressed: () {
                delectYes(context, student);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(rtx);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void delectYes(ctx, StudentModel student) {
    deleteStudent(student.id!);
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text("Successfully Deleted"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(ctx).pop();
  }
}
