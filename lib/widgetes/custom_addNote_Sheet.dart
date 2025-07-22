import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/Add_node_cubit/add_note_cubit.dart';
import '../cubit/notes/notes_cubit.dart';
import 'add_Note_Form.dart';

class addNoteBottomsheet extends StatelessWidget {
  const addNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      //بدل ما احطه للبرنامج كله, بحطوه حولين العنصر الي بدي
      create: (context) => AddNoteCubit(),
      //

      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        // BlocListener  كنت لاعمله
        // BlocConsumer بدل من
        // AbsorbPointer بس مو ضفت
        // re Build هي بتعمل
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print("failied${state.errMessage}");
          }
          if (state is AddNoteSuccess) {
            //
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            //  عدم القدرة على لمس او اختيار اي عنصر لحتى انتهاء العملية الانتظار
            absorbing: state is AddNoteLoading ? true : false,
            child: AddNoteForm(),
          );
        },
      ),
    );
  }
}
