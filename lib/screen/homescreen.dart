// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/controllerss/bottom_controller.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/screen/addstudent/addstudent.dart';
import 'package:sqflite_10/screen/gridscreen.dart';
import 'package:sqflite_10/screen/listscreeen.dart';
import 'package:sqflite_10/screen/searchscreen.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    getstudentdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'STUDENT RECORD',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchScreen(),
                  transition: Transition.leftToRightWithFade);
            },
            icon: const Icon(Icons.search_rounded),
            color: Colors.white,
          )
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
                child: bottomController.viewMode.value == 0
                    ? StudentListGridView()
                    : StudentList()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: true, // Show the add button
        child: FloatingActionButton(
          shape: CircleBorder(),
          elevation: 2, // shadow
          onPressed: () {
            addstudent(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3_rounded), label: 'Grid'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
          ],
          currentIndex: bottomController
              .selectedIndex.value, // go to the readme file 19 to 45
          onTap: (int index) {
            bottomController.changeScreen(index);
          },
        ),
      ),
    );
  }

  void addstudent(gtx) {
    Get.to(() => AddStudent(), transition: Transition.circularReveal);
  }
}
