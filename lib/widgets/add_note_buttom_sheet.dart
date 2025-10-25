import 'package:flutter/material.dart';
import 'package:note/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          SizedBox(height: 32),
          CustomTextField(hint: 'title'),
          SizedBox(height: 16),
          CustomTextField(hint: 'content', maxLines: 5),
        ],
      ),
    );
  }
}
