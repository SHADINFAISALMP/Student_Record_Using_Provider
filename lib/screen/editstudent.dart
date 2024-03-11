// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sqflite_10/controllerss/edit_controller.dart';
import 'package:sqflite_10/database/db_model.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  StudentModel student;

  EditStudent({super.key, required this.student});

  //  form key for the validation
  @override
  Widget build(BuildContext context) {
    Provider.of<Editcontroller>(context,listen: false).initialValues(
        imagePaths: student.imagex,
        name: student.name,
        classname: student.classname,
        quardianname: student.father,
        mobilename: student.pnumber);
    
    return Consumer<Editcontroller>(
      
      builder: (BuildContext context, studentEditController, Widget? child)=>
     Scaffold(
        appBar: AppBar(
          title: const Text('Edit Student'),
          actions: [
            IconButton(
              onPressed: ()async {
               await studentEditController.editstudentclicked(
                  context,
                  student,studentEditController
                );
                 
              },
              icon: const Icon(Icons.cloud_upload),
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: studentEditController.formKey, // Assign the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Stack(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  studentEditController.updatedImagepath.isNotEmpty
                                      ? FileImage(
                                          File(studentEditController.updatedImagepath))
                                      : AssetImage('assets/profile.png')
                                          as ImageProvider,
                              radius: 99),
                          Positioned(
                            bottom: 20,
                            right: 5,
                            child: IconButton(
                              onPressed: () {
                                studentEditController.editphoto(
                                 context,studentEditController);
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
                    Row(
                      children: [
                        const Icon(Icons.abc_outlined),
                        SizedBox(
                            width: 10), // Add spacing between icon and text field
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: studentEditController.editnameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
      
                    // Class input field with validation
                    Row(
                      children: [
                        const Icon(Icons.class_outlined),
                        SizedBox(
                            width: 10), // Add spacing between icon and text field
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: studentEditController.editclassController,
                            decoration: InputDecoration(
                              labelText: "Class",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Class';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
      
                    // Guardian input field with validation
                    Row(
                      children: [
                        const Icon(Icons.person),
                        SizedBox(
                            width: 10), // Add spacing between icon and text field
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: studentEditController.editguardianController,
                            decoration: InputDecoration(
                              labelText: "Age",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter age';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
      
                    // Mobile input field with validation
                    Row(
                      children: [
                        const Icon(Icons.phone_sharp),
                        SizedBox(
                            width: 10), // Add spacing between icon and text field
                        Expanded(
                          child: TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: studentEditController.editmobileController,
                            decoration: InputDecoration(
                              labelText: "Mobile",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Mobile';
                              } else if (value.length != 10) {
                                return 'Mobile number should be 10 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
