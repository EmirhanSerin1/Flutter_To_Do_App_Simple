import 'package:flutter/material.dart';


  buildTextField(Key key, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: key,
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                labelText: " Write down what to do",
                labelStyle: TextStyle(color: Colors.black)),
            validator: (value) {
              if (value.length < 1) {
                return "Please write anything";
              } else {
                return null;
              }
            },
          ),
        ),
      ),
    );
  }