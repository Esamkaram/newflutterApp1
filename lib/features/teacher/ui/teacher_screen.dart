import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/features/home/model/matter_model.dart';
import 'package:flutter_application_2/features/teacher/widgets/teacher_item_widget.dart';
import 'package:flutter_application_2/features/teacher_schedule/cubit/schedule_cubit.dart';
import 'package:flutter_application_2/features/teacher_schedule/ui/schedule_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key, required this.techerlist});
  final List<Teacher> techerlist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          context.push(BlocProvider(
            create: (context) => ScheduleCubit()..getScheduleteacher(),
            child: const ScheduleScreen(),
          ));
        },
        child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) => TeacherItemWidget(
                  teachermodel: techerlist[index],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: techerlist.length),
      ),
    );
  }
}
