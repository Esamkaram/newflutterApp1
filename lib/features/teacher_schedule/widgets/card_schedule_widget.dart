import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom_container.dart';
import 'package:flutter_application_2/features/card/cubit/card_cubit.dart';
import 'package:flutter_application_2/features/home/cubit/home_cubit.dart';
import 'package:flutter_application_2/features/home/ui/home_screen.dart';
import 'package:flutter_application_2/features/teacher_schedule/model/schedule_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScheduleWidget extends StatelessWidget {
  const CardScheduleWidget(
      {super.key,
      required this.schedule,
      required this.teacher,
      required this.teacherName});
  final Schedule schedule;
  final int teacher;
  final String teacherName;
  @override
  Widget build(BuildContext context) {
    // CardCubit cardCubit = CardCubit();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 6),
              blurRadius: 5.0,
              spreadRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'السنتر',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(schedule.cENTERNAME!),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const Text('اليوم',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(schedule.dAYNAME!),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const Text('الوقت',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(schedule.tIMETH!),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              BlocProvider(
                create: (context) => CardCubit(),
                child: BlocConsumer<CardCubit, CardState>(
                  listener: (context, state) {
                    if (state is CardSuccessStates) {
                      context.pushAndRemoveUntil(BlocProvider(
                        create: (context) => HomeCubit()..getHomeOfffers(),
                        child: const HomeScreen(),
                      ));
                    }
                  },
                  builder: (context, state) {
                    return CustomBottomContainer(
                      onTap: () {
                        context.read<CardCubit>().addCard(
                            CacheHelper.getDate(key: ChachKey.stidentId)
                                .toString(),
                            int.parse(schedule.dAYID!),
                            teacher,
                            schedule.tIMETH!,
                            int.parse(schedule.dAYID!),
                            schedule.dAYNAME!,
                            teacherName);
                      },
                      buIcon: Icons.add,
                      butext: 'اضافة للسلة ',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
