import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgetes/add_Note_Form.dart';
import '../widgetes/custom_Color_List.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   colorListView(),
    );
  }
}
