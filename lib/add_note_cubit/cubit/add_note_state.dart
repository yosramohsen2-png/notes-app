part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

// ✅ تم التعديل
final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}

// ✅ تم التعديل
final class AddNoteFaillure extends AddNoteState {
  final String error;

  AddNoteFaillure({required this.error}); // يفضل إضافة const
}
