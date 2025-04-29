import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customIcon extends StatelessWidget {
  const customIcon(
      {super.key, required this.isSearch, required this.onPressed});

  final bool isSearch ;
  final  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(isSearch ? Icons.close : Icons.search),
    );
  }
}
