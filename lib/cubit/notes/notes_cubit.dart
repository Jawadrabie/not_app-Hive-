import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:not_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> ?Notes;

  void fetchAllNotes() {
    var notesbox = Hive.box<NoteModel>("Note_box");
    Notes = notesbox.values.toList();
    emit(NotesSuccess());
  }
  void searchNotes(String query) {
    var notesbox = Hive.box<NoteModel>("Note_box");
    Notes = notesbox.values
        .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(NotesSuccess());
  }

}

