import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme/theme_cubit.dart';
import 'custom_icon_searsh.dart';

class appBar extends StatelessWidget {
  const appBar({
    super.key,
    required this.isSearching,
    required this.onChanged,
    required this.onCancel,
  });

  final bool isSearching;
  final Function(String) onChanged;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: isSearching
              ? TextField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: "Search by title...",
                    border: InputBorder.none,
                  ),
                )
              : Text(
                  "Notes",
                  style: TextStyle(fontSize: 30),
                ),
        ),

        Custom_icon_searsh(onCancel: onCancel,isSearching: isSearching,
        ),
        BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return IconButton(
              onPressed: () {
                themeCubit.toggleTheme();
              },
              icon: Icon(
                theme.brightness== Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            );
          },
        ),
      ],
    );
  }
}
