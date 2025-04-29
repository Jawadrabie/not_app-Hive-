import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField(
      {super.key, required this.hint, this.maxline = 1, this.onSaved, this.onChanged});

  final String hint;

  final int maxline;
  final void Function(String?)? onSaved;
  final  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
       // value?.isEmpty ?? true
        if (value == null || value.isEmpty) {
          return "Field is required";
        } else {
          return null;
        }
      },
      cursorColor: Colors.teal,
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hint,
        //  hintStyle: TextStyle(color: Colors.teal),

        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(Colors.teal),
      ),
    );
  }

  OutlineInputBorder BuildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
