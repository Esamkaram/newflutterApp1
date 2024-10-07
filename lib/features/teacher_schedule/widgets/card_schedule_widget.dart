import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom_container.dart';
import 'package:flutter_application_2/features/teacher_schedule/model/schedule_model.dart';

class CardScheduleWidget extends StatelessWidget {
  const CardScheduleWidget({super.key, required this.schedule});
  final Schedule schedule;
  @override
  Widget build(BuildContext context) {
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
              CustomBottomContainer(
                onTap: () {},
                buIcon: Icons.add,
                butext: 'اضافة للسلة ',
              )
            ],
          ),
        ),
      ),
    );
  }
}
