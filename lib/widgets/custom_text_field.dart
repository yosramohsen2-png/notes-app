import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onChanged,
    this.initialValue,
  });

  final String hint;
  final int maxLines;
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      maxLines: maxLines,
      // 🟢 تأكد إن الـVALIDATOR ده موجود بالظبط
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required'; // الرسالة اللي هتظهر تحت الحقل
        } else {
          return null;
        }
      },
      cursorColor: Colors.cyanAccent, // أو اللون اللي بتستخدمه
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(Colors.cyanAccent),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
