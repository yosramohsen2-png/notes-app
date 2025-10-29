import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:note/costants.dart';
import 'package:note/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesCubitSuccess(notes));
    } catch (e) {
      emit(NotesCubitFaillure(e.toString()));
    }
  }
}
