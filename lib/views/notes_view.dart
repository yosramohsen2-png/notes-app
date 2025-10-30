// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note/add_note_cubit/cubit/cubit/notes_cubit/notes_cubit_cubit.dart';
// import 'package:note/widgets/add_note_buttom_sheet.dart';
// import 'package:note/widgets/notes_view_body.dart';

// class NotesView extends StatelessWidget {
//   const NotesView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => NotesCubitCubit(),
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showModalBottomSheet(
//               isScrollControlled: true,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadiusGeometry.circular(16),
//               ),
//               context: context,
//               builder: (context) {
//                 return const AddNoteButtomSheet();
//               },
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//         resizeToAvoidBottomInset: false,
//         extendBodyBehindAppBar: true,
//         body: const NotesViewBody(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_note_cubit/cubit/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:note/widgets/add_note_buttom_sheet.dart';
import 'package:note/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotesCubitCubit()
            ..fetchAllNotes(), // 💡: عشان يجلب النوتات أول ما يفتح
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteButtomSheet();
              },
            );
          },
          child: const Icon(Icons.add), // ضفنا const
        ),
        // شلنا resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: const NotesViewBody(),
      ),
    );
  }
}
