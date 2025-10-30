import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_note_cubit/cubit/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 مهم: عشان البناء (builder) يشتغل صح من أول مرة
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        // ✨ هذا هو التعديل الأساسي: الاعتماد مباشرةً على قائمة notes في الـ Cubit
        List<NoteModel> notes =
            BlocProvider.of<NotesCubitCubit>(context).notes ?? [];

        if (notes.isEmpty) {
          return const Center(child: Text('There are no notes yet.'));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              // 1. القراءة والتأكد بتتم مرة واحدة
              NoteModel note = notes[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                // 2. 🥳 استخدام المتغير الآمن (note) مباشرةً
                child: NoteItem(note: note), // 👈 تم التعديل هنا
              );
            },
          ),
        );
      },
    );
  }
}
