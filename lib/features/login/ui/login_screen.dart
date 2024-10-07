import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom.dart';
import 'package:flutter_application_2/core/widgets/custom_textform.dart';
import 'package:flutter_application_2/features/home/cubit/home_cubit.dart';
import 'package:flutter_application_2/features/home/ui/home_screen.dart';
import 'package:flutter_application_2/features/login/cubit/login_cubit.dart';
import 'package:flutter_application_2/features/login/widgets/lable_text.dart';
import 'package:flutter_application_2/features/registers/cubit/cubit.dart';
import 'package:flutter_application_2/features/registers/ui/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.pushAndRemoveUntil(BlocProvider(
            create: (context) => HomeCubit()..getHomeOfffers(),
            child: const HomeScreen(),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Login',
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: loginCubit.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.assetsImagesMobileloginAmico,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    LableText(
                      hederTextLable: "phon number".tr(),
                      textFormFiled: CustomTextform(
                        controller: loginCubit.phoneController,
                        type: TextInputType.phone,
                        hittext: "username".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.person,
                        validate: (v) {
                          if (v!.isEmpty && v.trim().isEmpty) {
                            return 'this phone is requer';
                          }
                          return null;
                        },
                      ),
                    ),
                    LableText(
                      hederTextLable: "password".tr(),
                      textFormFiled: CustomTextform(
                        controller: loginCubit.passwordController,
                        type: TextInputType.visiblePassword,
                        hittext: "password".tr(),
                        borderColor: Colors.black,
                        suffix: Icons.lock_open_outlined,
                        preFix: Icons.lock,
                        validate: (v) {
                          if (v!.isEmpty && v.trim().isEmpty) {
                            return 'this password is requer';
                          }
                          return null;
                        },
                      ),
                    ),
                    CustomBottom(
                      text: "login".tr(),
                      onpressed: () {
                        if (loginCubit.formkey.currentState!.validate()) {
                          loginCubit.userLogin();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "registernow".tr(),
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        TextButton(
                            onPressed: () {
                              context.push(BlocProvider(
                                create: (context) => RegisterCubit(),
                                child: const RegisterScreen(),
                              ));
                            },
                            child: Text("createnewaccount".tr()))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
