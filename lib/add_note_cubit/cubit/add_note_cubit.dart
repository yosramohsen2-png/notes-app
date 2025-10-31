// import 'dart:ui';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:meta/meta.dart';
// import 'package:note/costants.dart';
// import 'package:note/models/note_model.dart';

// part 'add_note_state.dart';

// class AddNoteCubit extends Cubit<AddNoteState> {
//   AddNoteCubit() : super(AddNoteInitial());
//   Color color = Colors.red;
//   void addNote(NoteModel note) async {
//     emit(AddNoteLoading());
//     try {
//       var notesBox = Hive.box<NoteModel>(kNotesBox);

//       await notesBox.add(note);
//       emit(AddNoteSuccess());
//     } catch (e) {
//       emit(AddNoteFaillure(error: e.toString()));
//     }
//   }
// }
// داخل AddNoteCubit
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note/costants.dart';
import 'package:note/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Colors.red;

  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      // 🟢 الخطوة الحاسمة: إنشاء نوتة جديدة باللون المختار من الكيوبت وبشفافية كاملة
      final newNoteWithColor = NoteModel(
        title: note.title!, // استخدام البيانات من النوتة القديمة
        subTitle: note.subTitle!,
        date: note.date!,
        // 🟢 ضمان شفافية كاملة (0xFF) عشان اللون يكون واضح
        color: color.value | 0xFF000000,
      );

      await notesBox.add(newNoteWithColor);

      emit(AddNoteSuccess());
    } catch (e) {
      print('Error while adding note to Hive: $e');
      emit(AddNoteFaillure(error: e.toString()));
    }
  }
}
