import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/model/matter_model.dart';
import 'package:flutter_application_2/features/teacher/widgets/teacher_item_widget.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen(
      {super.key, required this.techerlist, required this.matter});
  final List<Teacher> techerlist;
  final int matter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, index) => TeacherItemWidget(
                teachermodel: techerlist[index],
                matter: matter,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: techerlist.length),
    );
  }
}
