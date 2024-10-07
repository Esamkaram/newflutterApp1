import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/assets.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom.dart';
import 'package:flutter_application_2/features/login/cubit/login_cubit.dart';
import 'package:flutter_application_2/features/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesSplachImage,
              width: double.infinity,
            ),
            const SizedBox(
              height: 50.0,
            ),
            CustomBottom(
              text: 'ابداء الان',
              onpressed: () async {
                await CacheHelper.saveData(key: ChachKey.isfirstopen, value: 1);
                context.push(BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
