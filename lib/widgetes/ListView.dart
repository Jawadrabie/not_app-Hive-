import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubit/notes/notes_cubit.dart';
import 'package:not_app/model/note_model.dart';
import 'Custom_Note.dart';

class listView extends StatelessWidget {
  const listView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).Notes??[];
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: CustomNote(
                  notes:notes[index] ,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
