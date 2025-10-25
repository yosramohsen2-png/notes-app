import 'package:flutter/material.dart';
import 'package:note/widgets/add_note_buttom_sheet.dart';
import 'package:note/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteButtomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: const NotesViewBody(),
    );
  }
}
