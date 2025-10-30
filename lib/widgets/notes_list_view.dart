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
    // ونضمن إن البيانات اتجلبت لما الكيوبت اتنشط في NotesView
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        // ✨ هذا هو التعديل الأساسي: الاعتماد مباشرةً على قائمة notes في الـ Cubit
        // لما بيحصل emit(NotesCubitInitial())، الـ BlocBuilder بيتحدث وبيستخدم القائمة دي.
        List<NoteModel> notes =
            BlocProvider.of<NotesCubitCubit>(context).notes ?? [];

        if (notes.isEmpty) {
          // ممكن هنا تعرض رسالة "مفيش ملاحظات"
          return const Center(child: Text('مفيش ملاحظات لحد دلوقتي!'));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            // هنا بنستخدم طول القائمة
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              NoteModel note = notes[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(note: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
