import 'package:flutter/material.dart';
import 'package:note/widgets/custom_app_bar.dart';
import 'package:note/widgets/custom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          SizedBox(height: 50),
          CustomTextField(hint: 'title'),
          SizedBox(height: 16),
          CustomTextField(hint: 'content', maxLines: 5),
        ],
      ),
    );
  }
}
