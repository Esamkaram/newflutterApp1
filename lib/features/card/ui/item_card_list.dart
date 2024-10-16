import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card/model/carde_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemCardList extends StatelessWidget {
  const ItemCardList({super.key, required this.carde});

  final Carde carde;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),

          // All actions are defined in the children parameter.
          children: const [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            // SlidableAction(
            //   onPressed: doNothing,
            //   backgroundColor: Color(0xFF21B7CA),
            //   foregroundColor: Colors.white,
            //   icon: Icons.share,
            //   label: 'Share',
            // ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'اسم المدرس',
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      carde.teacherName!,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'اليوم',
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(carde.dayName!),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Text(
                      'الساعة',
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(carde.timeTh!),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
