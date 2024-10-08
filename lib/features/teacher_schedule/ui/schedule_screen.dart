import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/teacher_schedule/cubit/schedule_cubit.dart';
import 'package:flutter_application_2/features/teacher_schedule/widgets/card_schedule_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ScheduleCubit scheduleCubit = BlocProvider.of(context);
    ScheduleCubit scheduleCubit = BlocProvider.of<ScheduleCubit>(context);

    return BlocConsumer<ScheduleCubit, ScheduleState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: (state is! ScheduleLodingstate)
                  ? Text(scheduleCubit.scheduleModel!.date!.teacherName!)
                  : const CircularProgressIndicator()),
          body: (state is! ScheduleLodingstate)
              ? ListView.separated(
                  itemBuilder: (context, index) => Center(
                        child: CardScheduleWidget(
                          schedule: scheduleCubit
                              .scheduleModel!.date!.schedule![index],
                              teacher: scheduleCubit.scheduleModel!.date!.teacherId!,
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount:
                      scheduleCubit.scheduleModel!.date!.schedule!.length)
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
