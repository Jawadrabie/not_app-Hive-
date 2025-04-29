import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:not_app/model/note_model.dart';
import 'package:not_app/widgetes/custom_AppBar.dart';
import 'package:not_app/widgetes/custom_Buttom.dart';
import 'package:not_app/widgetes/custom_Color_List.dart';
import 'package:not_app/widgetes/custom_textField.dart';
import 'Constant/Constant.dart';
import 'cubit/Add_node_cubit/add_note_cubit.dart';
import 'cubit/notes/notes_cubit.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, content;
  bool isSearching = false;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: appBar(
                  isSearching: isSearching,
                  onChanged: (value) {
                    setState(() {});
                    searchText = value;
                  },
                  onCancel: () {
                    setState(() {
                      isSearching = !isSearching;
                      searchText = "";
                    });
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  }),
            ),
            SizedBox(
              height: 35,
            ),
            textField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            SizedBox(
              height: 20,
            ),
            textField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.content,
              maxline: 6,
            ),
            SizedBox(
              height: 16,
            ),
            editNoteColorList(
              note: widget.note,
            ),
            SizedBox(
              height: 16,
            ),
            Buttom(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: "Edit",
            ),
          ],
        ),
      ),
    );
  }
}

class editNoteColorList extends StatefulWidget {
  const editNoteColorList({super.key, required this.note});

  final NoteModel note;

  @override
  State<editNoteColorList> createState() => _editNoteColorListState();
}

class _editNoteColorListState extends State<editNoteColorList> {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    currentIndex = Kcolors.indexWhere((c) => c.value == widget.note.color);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: Kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
                widget.note.color = Kcolors[index].value;
              },
              child: colorItem(
                color: Kcolors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
