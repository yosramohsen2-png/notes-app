// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 👈 عشان نستخدم BlocProvider
import 'package:note/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:note/add_note_cubit/cubit/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:note/costants.dart';
import 'package:note/models/note_model.dart';
import 'package:note/widgets/colors_list_view.dart';
import 'package:note/widgets/custom_app_bar.dart';
import 'package:note/widgets/custom_text_field.dart';
import 'package:note/widgets/edit_notes_colors_list.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title;
  String? subtitle;

  @override
  void initState() {
    super.initState();
    title = widget.note.title;
    subtitle = widget.note.subTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              // بنحدث قيم الملاحظة
              widget.note.title = title;
              widget.note.subTitle = subtitle;

              // 1. حفظ النوتة في Hive
              widget.note.save();

              // 2. 🟢 تحديث الـNotes View
              // بننادي دالة جلب النوتات عشان تظهر التعديلات فوراً
              BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

              // 3. الخروج من شاشة التعديل
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            // initialValue بيخلي النص القديم يظهر
            initialValue: widget.note.title,
            onChanged: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            initialValue: widget.note.subTitle,
            onChanged: (value) {
              subtitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          SizedBox(height: 16),
          EditNotesColorsList(note: widget.note),
        ],
      ),
    );
  }
}
