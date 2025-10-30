// import 'package:bloc/bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';
// import 'package:note/costants.dart';
// import 'package:note/models/note_model.dart';

// part 'notes_cubit_state.dart';

// class NotesCubitCubit extends Cubit<NotesCubitState> {
//   NotesCubitCubit() : super(NotesCubitInitial());
//   List<NoteModel>? notes;
//   fetchAllNotes() {
//     var notesBox = Hive.box<NoteModel>(kNotesBox);
//     List<NoteModel> notes = notesBox.values.toList();
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/costants.dart';
import 'package:note/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  // تعريف متغير القائمة على مستوى الكلاس عشان يكون متاح للكل
  List<NoteModel>? notes;

  // استدعاء الدالة داخل الـ Constructor عشان تجلب البيانات أول ما التطبيق يبدأ
  NotesCubitCubit() : super(NotesCubitInitial()) {
    fetchAllNotes();
  }

  // الدالة المسؤولة عن جلب البيانات وتحديث الـ UI
  fetchAllNotes() {
    try {
      // 1. فتح صندوق Hive
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      // 2. جلب البيانات وتخزينها في متغير الكلاس (this.notes)
      notes = notesBox.values.toList();

      // 3. ✨ أهم خطوة: استدعاء حالة Initial
      // (يفضل تكون حالة اسمها NotesCubitSuccess بس هنستخدم Initial كحالة تحديث مؤقتة)
      // الـ emit ده هو اللي هيخلي الـ BlocBuilder يعمل تحديث ويعرض الملاحظات
      emit(NotesCubitInitial());
    } catch (e) {
      // لو حصل خطأ في جلب البيانات، اطبعه عشان نعرف المشكلة فين
      print('Failed to fetch notes: $e');
      // ممكن هنا تعمل emit(NotesCubitFailure());
    }
  }
}
