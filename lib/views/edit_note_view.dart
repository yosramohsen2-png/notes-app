import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';
import 'package:note/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditViewBody(note: note));
  }
}
