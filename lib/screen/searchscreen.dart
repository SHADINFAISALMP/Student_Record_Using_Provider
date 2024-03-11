import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sqflite_10/controllerss/student_controller.dart';
import 'package:sqflite_10/screen/studentdetails.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Provider.of<StudentController>(context,listen: false).getSearchResults("");
  
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
                 
                      context.read<StudentController>().getSearchResults(value),
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: Consumer<StudentController>(
                 builder: (context, studentController, child)  {
                    if (studentController.filteredStudentList.isEmpty) {
                      // Show a message when there are no search results
                      return const Center(
                        child: Text(
                          'No results found',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    } else {
                      return ListView.builder(
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
                              subtitle:
                                  Text('CLASS : ${finduserItem.classname}'),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => StudentDetails(
                                        stdetails: finduserItem)));
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
