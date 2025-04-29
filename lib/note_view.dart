import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubit/notes/notes_cubit.dart';
import 'package:not_app/widgetes/Custom_Note.dart';
import 'package:not_app/widgetes/ListView.dart';
import 'package:not_app/widgetes/custom_addNote_Sheet.dart';
import 'package:not_app/widgetes/custom_icon_searsh.dart';
import 'package:not_app/widgetes/custom_textField.dart';
import 'package:not_app/widgetes/custom_AppBar.dart';

class NotView extends StatefulWidget {
  const NotView({super.key});

  @override
  State<NotView> createState() => _NotViewState();
}

class _NotViewState extends State<NotView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  bool isSearching = false;
  String searchText = "";

  void handleSearch(String value) {
    BlocProvider.of<NotesCubit>(context).searchNotes(value);
  }

  void cancelSearch() {
    setState(() {
      isSearching = false;
      searchText = "";
    });
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return addNoteBottomsheet();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: appBar(
              isSearching: isSearching,
              onChanged: (value) {
                setState(() {});
                handleSearch(value);
                searchText = value;
              },
              onCancel: () {
                if (isSearching) {
                  cancelSearch();
                } else {
                  setState(() {
                    isSearching = true;
                  });
                }
              },
            ),
          ),
          listView(),
        ],
      ),
    );
  }
}
