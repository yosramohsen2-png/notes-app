// import 'package:flutter/material.dart';
// import 'package:note/models/note_model.dart';
// import 'package:note/widgets/custom_app_bar.dart';
// import 'package:note/widgets/custom_text_field.dart';

// class EditViewBody extends StatefulWidget {
//   const EditViewBody({super.key, required this.note});
//   final NoteModel note;

//   @override
//   State<EditViewBody> createState() => _EditViewBodyState();
// }

// class _EditViewBodyState extends State<EditViewBody> {
//   String? title, subtitle;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Column(
//         children: [
//           const SizedBox(height: 50),
//           CustomAppBar(
//             onPressed: () {
//               if (title != null || subtitle != null) {
//                 widget.note.title = title ?? widget.note.title;
//                 widget.note.subTitle = subtitle ?? widget.note.subTitle;
//                 widget.note.save();
//               }
//             },
//             title: 'Edit Note',
//             icon: Icons.check,
//           ),
//           const SizedBox(height: 50),
//           CustomTextField(
//             onChanged: (value) {
//               title = value;
//             },
//             hint: 'title',
//           ),
//           const SizedBox(height: 16),
//           CustomTextField(
//             onChanged: (value) {
//               subtitle = value;
//             },
//             hint: 'content',
//             maxLines: 5,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';
import 'package:note/widgets/custom_app_bar.dart';
// تأكد إن المسار صح
import 'package:note/widgets/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  // بنجهز المتغيرات دي عشان نحط فيها القيمة الأصلية وبعدين التعديل
  String? title;
  String? subtitle;

  // 👈 بنستخدم initState عشان نجهز القيم الأولية
  @override
  void initState() {
    super.initState();
    // بنجهز المتغيرات بالقيمة الأصلية للملاحظة
    title = widget.note.title;
    subtitle = widget.note.subTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              // 👈 بنحدث قيم الملاحظة بالـ title والـ subtitle اللي في الـ State
              widget.note.title = title;
              widget.note.subTitle = subtitle;

              widget.note.save();
              // عشان يرجع للشاشة اللي قبلها بعد الحفظ
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            // 👈 بنمرر القيمة الحالية عشان تظهر للمستخدم
            initialValue: widget.note.title,
            onChanged: (value) {
              // بنحدث الـ title في الـ State لما النص يتغير
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            // 👈 بنمرر القيمة الحالية عشان تظهر للمستخدم
            initialValue: widget.note.subTitle,
            onChanged: (value) {
              // بنحدث الـ subtitle في الـ State لما النص يتغير
              subtitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
