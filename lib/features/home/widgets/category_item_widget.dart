import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/features/home/model/matter_model.dart';
import 'package:flutter_application_2/features/teacher/ui/teacher_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.model});
  final MatterItem model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(TeacherScreen(techerlist: model.teacher!));
      },
      child: Column(
        children: [
          Expanded(child: Image.network(model.matterImg!)),
          Text(
            model.matterName!,
          ),
        ],
      ),
    );
  }
}
