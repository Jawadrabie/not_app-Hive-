import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubit/notes/notes_cubit.dart';
import 'package:not_app/model/note_model.dart';

import '../Edit_NoteView.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key, required this.notes});

  final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Color(notes.color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الجهة اليسار: النصوص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notes.title,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  notes.content,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.8)),
                ),
              ],
            ),
          ),

          // الجهة اليمين: الأزرار + التاريخ
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditNote(
                            note: notes,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      notes.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("تم حذف الملاحظة بنجاح ✅"),
                          backgroundColor: Colors.teal,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                notes.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomNote extends StatelessWidget {
//   const CustomNote({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only( left: 24,bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.brown,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//
//           ListTile(
//             contentPadding: EdgeInsets.only(bottom: 0,top: 0,left: 0,right: 8),
//             title: Text(
//               "first task",
//               style: TextStyle(fontSize: 28, color: Colors.black),
//             ),
//             subtitle: Text(
//               "hii I'am jawad",
//               style:
//               TextStyle(fontSize: 18, color: Colors.black.withOpacity(.8)),
//             ),
//             trailing: SizedBox(
//               width: 70,
//               child: Row(
//                 children: [
//                   IconButton(onPressed: (){}, icon: Icon(Icons.add)),
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.delete,
//                         color: Colors.black,
//                         size: 33,
//                       )),
//                 ],
//               ),
//             ),
//           ),
//           Text(
//             "4/7/2025",
//             style: TextStyle(
//               color: Colors.black.withOpacity(.8),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
