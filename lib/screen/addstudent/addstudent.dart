// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sqflite_10/controllerss/add_student_controller.dart';
import 'package:sqflite_10/screen/addstudent/textformfield.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AddstudentController>(context, listen: false).intialization();
    // Provider.of<AddstudentController>(context,listen: false).intialization();

    return Consumer<AddstudentController>(
      builder: (context, studentaddcontroller, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'ADD STUDENT',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                studentaddcontroller.addstudentclicked(context,studentaddcontroller);
              },
              icon: const Icon(
                Icons.save_rounded,
                color: Colors.white,
              ),
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: studentaddcontroller.formKey, // The form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Stack(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                studentaddcontroller.imagepath.isNotEmpty
                                    ? FileImage(
                                        File(studentaddcontroller.imagepath))
                                    : AssetImage('assets/profile.png')
                                        as ImageProvider,
                            radius: 99),
                        Positioned(
                          bottom: 20,
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              studentaddcontroller.addphoto(
                                  context, context, studentaddcontroller);
                            },
                            icon: const Icon(Icons.add_a_photo_outlined),
                            color: Color.fromARGB(255, 255, 255, 255),
                            iconSize: 40,
                          ),
                        ),
                      ],
                    ),
                  

                  const SizedBox(height: 50),
                  // Name input field with validation
                  NameTextFormField(addcontroller: studentaddcontroller),
                  const SizedBox(height: 25),
                  // Class input field with validation
                  NumberTextFormField(addcontroller: studentaddcontroller),
                  const SizedBox(height: 20),

                  // Guardian input field with validation
                  AgeTextFormField(addcontroller: studentaddcontroller),
                  const SizedBox(height: 20),

                  // Mobile input field with validation
                  MobileTextFormField(addcontroller: studentaddcontroller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
