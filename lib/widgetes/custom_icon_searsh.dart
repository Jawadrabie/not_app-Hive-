import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_icon_searsh extends StatelessWidget {
  const Custom_icon_searsh({
    super.key,
    required this.onCancel,
    required this.isSearching,
  });

  final VoidCallback onCancel;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: onCancel,
        icon: Icon(isSearching ? Icons.close : Icons.search),
      ),
    );
  }
}
