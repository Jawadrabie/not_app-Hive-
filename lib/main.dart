import 'package:flutter/material.dart';

import 'note_view.dart';

void main() {
  runApp(const notapp());
}

class notapp extends StatelessWidget {
  const notapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().,
      home: NotView(),
    );
  }
}
