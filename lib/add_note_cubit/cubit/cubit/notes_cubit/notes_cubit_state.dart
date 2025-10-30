// part of 'notes_cubit_cubit.dart';

// @immutable
// sealed class NotesCubitState {}

// final class NotesCubitInitial extends NotesCubitState {}
part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

// ✨ الإضافة دي هي اللي كانت ناقصة
final class NotesCubitSuccess extends NotesCubitState {
  final List<NoteModel> notes;

  NotesCubitSuccess(this.notes);
}
