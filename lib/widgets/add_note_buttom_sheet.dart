// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note/add_note_cubit/cubit/add_note_cubit.dart';
// import 'package:note/widgets/add_note_form.dart';

// class AddNoteButtomSheet extends StatefulWidget {
//   const AddNoteButtomSheet({super.key});

//   @override
//   State<AddNoteButtomSheet> createState() => _AddNoteButtomSheetState();
// }

// class _AddNoteButtomSheetState extends State<AddNoteButtomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddNoteCubit(),
//       child: BlocConsumer<AddNoteCubit, AddNoteState>(
//         listener: (context, state) {
//           if (state is AddNoteFaillure) {
//             print('Failled ${state.error}');
//           }
//           if (state is AddNoteSuccess) {
//             Navigator.pop(context);
//           }
//         },
//         builder: (context, state) {
//           print('ui rebuild');
//           return AbsorbPointer(
//             absorbing: state is AddNoteLoading ? true : false,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 16,
//                 right: 16,
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: const SingleChildScrollView(child: AddNoteForm()),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:note/add_note_cubit/cubit/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:note/widgets/add_note_form.dart';

class AddNoteButtomSheet extends StatefulWidget {
  const AddNoteButtomSheet({super.key});

  @override
  State<AddNoteButtomSheet> createState() => _AddNoteButtomSheetState();
}

class _AddNoteButtomSheetState extends State<AddNoteButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFaillure) {
            print('Failled ${state.error}');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            // ✨ الخطوة الحاسمة: تحديث الـ Cubit المسؤول عن عرض النوتات
            BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
          }
        },
        builder: (context, state) {
          print('ui rebuild');
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
