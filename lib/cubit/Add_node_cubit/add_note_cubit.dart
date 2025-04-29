import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:not_app/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color=Color(0xF4FF3636);

  addNote(NoteModel note) {
    note.color = color.value;
    //value to translent color to integer
    emit(AddNoteLoading());
    try {
      var notesbox = Hive.box<NoteModel>("Note_box");
      notesbox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(
        AddNoteFailure(e.toString()),
      );
    }
  }
}
