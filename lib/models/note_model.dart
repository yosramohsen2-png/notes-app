import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  // خليها مش final عشان تقدر تغير قيمتها لما تعمل save()
  String? title;

  @HiveField(1)
  // خليها مش final
  String? subTitle;

  @HiveField(2)
  final String? date;

  @HiveField(3)
  int? color;

  NoteModel({this.title, this.subTitle, this.date, this.color});
}
// import 'package:hive/hive.dart';
// part 'note_model.g.dart';

// @HiveType(typeId: 0)
// class NoteModel extends HiveObject {
//   @HiveField(0)
//   final String title;

//   @HiveField(1)
//   final String subTitle;

//   @HiveField(2)
//   final String date;

//   @HiveField(3)
//   final int color; // نرجعها final

//   NoteModel({
//     required this.title,
//     required this.subTitle,
//     required this.date,
//     required this.color,
//   });
// }
// 💡 ملاحظة: لازم تشغل 'flutter pub run build_runner build' عشان الـmodel.g.dart يتحدث
