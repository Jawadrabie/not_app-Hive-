import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/observer/simle_bloc_observer.dart';
import 'package:not_app/test/homepage.dart';
import 'cubit/notes/notes_cubit.dart';
import 'cubit/theme/theme_cubit.dart';
import 'model/note_model.dart';
import 'note_view.dart';

void main() async {
  Bloc.observer = SimleBlocObserver();
  //"Note_box" متل اسم الكولكشن
  //Hive تبعيت flutter وليس dart  انتبه
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>("Note_box");

  runApp(const notapp());
}

class notapp extends StatelessWidget {
  const notapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: NotView(),

            //  homepage()
          );
        },
      ),
    );
  }
}
