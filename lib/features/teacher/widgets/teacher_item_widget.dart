import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/model/matter_model.dart';

class TeacherItemWidget extends StatelessWidget {
  const TeacherItemWidget({super.key, required this.teachermodel});
  final Teacher teachermodel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
