import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/style/colors.dart';

class CustomBottomContainer extends StatelessWidget {
  const CustomBottomContainer(
      {super.key, this.onTap, this.buIcon, this.butext});
  final VoidCallback? onTap;
  final IconData? buIcon;
  final String? butext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.0),
            color: AppColos.primeColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (butext != null)
                Text(
                  butext!,
                ),
              Icon(
                buIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
