import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custimIcon.dart';

class appbar extends StatefulWidget {
  const appbar({super.key,});

  @override
  State<appbar> createState() => _appbarState();
}

bool isSearch = false;

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isSearch ?
        Center(child: TextFormField())
            : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("jawad", style: TextStyle(fontSize: 30),),
                customIcon(isSearch: isSearch, onPressed:(){
                  isSearch=!isSearch;
                  setState(() {});

                }

                  ,),
              ],
            )),
      ),
    );
  }
}
