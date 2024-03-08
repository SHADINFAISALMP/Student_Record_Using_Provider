import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite_10/controllerss/add_student_controller.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    required this.addcontroller,
  });

  final AddstudentController addcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: addcontroller.nameController,
      decoration: InputDecoration(
        hintText: "Enter a Name",
        labelText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: const Icon(Icons.abc_outlined),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a Name';
        }
        return null;
      },
    );
  }
}

class NumberTextFormField extends StatelessWidget {
  const NumberTextFormField({
    super.key,
    required this.addcontroller,
  });

  final AddstudentController addcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 2,
      controller: addcontroller.classController,
      decoration: InputDecoration(
        hintText: "Enter Class",
        labelText: "Class",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: const Icon(Icons.class_outlined),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a Class';
        }
        return null;
      },
    );
  }
}

class AgeTextFormField extends StatelessWidget {
  const AgeTextFormField({
    super.key,
    required this.addcontroller,
  });

  final AddstudentController addcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      maxLength: 2,
      controller: addcontroller.guardianController,
      decoration: InputDecoration(
        hintText: "Enter Age",
        labelText: "Age",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: const Icon(Icons.numbers_outlined),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter age';
        }
        return null;
      },
    );
  }
}

class MobileTextFormField extends StatelessWidget {
  const MobileTextFormField({
    super.key,
    required this.addcontroller,
  });

  final AddstudentController addcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      controller: addcontroller.mobileController,
      decoration: InputDecoration(
        hintText: "Enter Mobile Number",
        labelText: "Mobile",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: const Icon(Icons.phone_sharp),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a Mobile';
        } else if (value.length != 10) {
          return 'Mobile number should be 10 digits';
        }
        return null;
      },
    );
  }
}
