import 'package:flutter/material.dart';
import 'package:note/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: const NotesViewBody(),
    );
  }
}
