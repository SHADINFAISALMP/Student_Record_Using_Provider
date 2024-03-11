// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sqflite_10/controllerss/bottom_controller.dart';

import 'package:sqflite_10/screen/addstudent/addstudent.dart';
import 'package:sqflite_10/screen/gridscreen.dart';
import 'package:sqflite_10/screen/listscreeen.dart';
import 'package:sqflite_10/screen/searchscreen.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomController>(
        builder: (context, bottomController, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  'STUDENT RECORD',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen()));
                    },
                    icon: const Icon(Icons.search_rounded),
                    color: Colors.white,
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                      child: bottomController.viewMode == 0
                          ? StudentListGridView()
                          : StudentList()),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Visibility(
                visible: true, // Show the add button
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  shape: CircleBorder(),
                  elevation: 2, // shadow
                  onPressed: () {
                    addstudent(context);
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              bottomNavigationBar: Consumer(
                builder: (context, value, child) => BottomNavigationBar(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.grid_3x3_rounded), label: 'Grid'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list), label: 'List')
                  ],
                  currentIndex: bottomController
                      .selectedIndex, // go to the readme file 19 to 45
                  onTap: (int index) {
                    bottomController.changeScreen(index);
                  },
                ),
              ),
            ));
  }

  void addstudent(gtx) {
    Navigator.of(gtx)
        .push(MaterialPageRoute(builder: (context) => AddStudent()));
  }
}
