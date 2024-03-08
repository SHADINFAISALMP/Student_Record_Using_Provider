import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';
import 'package:sqflite_10/screen/studentdetails.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    studentController.getSearchResults("");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  onChanged: (value) =>
                      studentController.getSearchResults(value),
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: studentController.filteredStudentList.length,
                    itemBuilder: (context, index) {
                      final finduserItem =
                          studentController.filteredStudentList[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(File(finduserItem.imagex)),
                          ),
                          title: Text(finduserItem.name),
                          subtitle: Text('CLASS : ${finduserItem.classname}'),
                          onTap: () {
                            Get.to(
                                () => StudentDetails(stdetails: finduserItem),
                                transition: Transition.circularReveal);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
