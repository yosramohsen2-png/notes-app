import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_note_cubit/cubit/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditNoteView(note: note);
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
          decoration: BoxDecoration(
            color: Color(note.color ?? 0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title ?? '',

                  style: const TextStyle(color: Colors.black, fontSize: 26),
                ),

                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    note.subTitle ?? '',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(Icons.delete),
                  color: const Color.fromARGB(255, 50, 50, 50),
                  iconSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 16),
                child: Text(
                  note.date ?? '',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 49, 48, 48),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
