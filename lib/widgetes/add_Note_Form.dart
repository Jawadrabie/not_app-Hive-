import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/model/note_model.dart';
import 'package:intl/intl.dart';
import '../cubit/Add_node_cubit/add_note_cubit.dart';
import 'custom_Buttom.dart';
import 'custom_Color_List.dart';
import 'custom_textField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formkey = GlobalKey();
  String? title, content;

  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          // من اجل الكيبورد
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              textField(
                hint: "Title",
                onSaved: (value) {
                  title = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              textField(
                hint: "Content",
                onSaved: (value) {
                  content = value;
                },
                maxline: 6,
              ),
              SizedBox(
                height: 8,
              ),
              colorListView(),
              SizedBox(
                height: 8,
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                  builder: (context, state) {
                return Buttom(
                  Isloading: state is AddNoteLoading ? true : false,
                  title: "Save",
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                      var currentDate = DateTime.now(); //pakage intl
                      var formattedCurentDate =
                          DateFormat.yMd().format(currentDate);

                      NoteModel notesModel = NoteModel(
                        title: title!,
                        content: content!,
                        color: Colors.blue.value,
                        // color: BlocProvider.of<AddNoteCubit>(context).color!.value,
                        date: formattedCurentDate,
                      );
                      BlocProvider.of<AddNoteCubit>(context)
                          .addNote(notesModel);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                );
              }),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
