import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/features/home/model/matter_model.dart';
import 'package:flutter_application_2/features/teacher_schedule/cubit/schedule_cubit.dart';
import 'package:flutter_application_2/features/teacher_schedule/ui/schedule_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherItemWidget extends StatelessWidget {
  const TeacherItemWidget({super.key, required this.teachermodel, required this.matter});
  final Teacher teachermodel;
  final int matter ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          context.push(BlocProvider(
            create: (context) => ScheduleCubit()..getScheduleteacher(tea:teachermodel.tEACHERID!  , matt:matter  ),
            child: const ScheduleScreen(),
          ));
      },
      child: Container(
        // padding: const EdgeInsets.all(5.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CachedNetworkImage(
          imageUrl: teachermodel.tEACHERIMG ?? '',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
