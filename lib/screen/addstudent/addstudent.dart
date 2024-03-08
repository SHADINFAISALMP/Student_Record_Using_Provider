// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controllerss/add_student_controller.dart';
import 'package:sqflite_10/screen/addstudent/textformfield.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    addcontroller.intialization();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'ADD STUDENT',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              addcontroller.addstudentclicked(context);
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
            key: addcontroller.formKey, // The form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: addcontroller
                                  .imagepath.value.isNotEmpty
                              ? FileImage(File(addcontroller.imagepath.value))
                              : AssetImage('assets/profile.png')
                                  as ImageProvider,
                          radius: 99),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          addcontroller.addphoto(context, context);
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
                NameTextFormField(addcontroller: addcontroller),
                const SizedBox(height: 25),
                // Class input field with validation
                NumberTextFormField(addcontroller: addcontroller),
                const SizedBox(height: 20),

                // Guardian input field with validation
                AgeTextFormField(addcontroller: addcontroller),
                const SizedBox(height: 20),

                // Mobile input field with validation
                MobileTextFormField(addcontroller: addcontroller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
