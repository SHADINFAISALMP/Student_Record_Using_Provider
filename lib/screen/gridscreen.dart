// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/screen/studentdetails.dart';

class StudentListGridView extends StatelessWidget {
  const StudentListGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    studentController.initialize();
    return Obx(
      ()=> GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns here
        ),
        itemCount: studentController.studentLists.length,
        itemBuilder: (context, index) {
          final student = studentController.studentLists[index];
      
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 1,
            child: InkWell(
              onTap: () {
                Get.to(() => StudentDetails(stdetails: student),
                    transition: Transition.circularReveal,
                    duration: Duration(milliseconds: 500));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: FileImage(
                      File(student.imagex),
                    ),
                    radius: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(student.name),
                  Text(
                    "Class: ${student.classname}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
