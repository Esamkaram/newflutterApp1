import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom.dart';
import 'package:flutter_application_2/core/widgets/custom_dropdowntextstell.dart';
import 'package:flutter_application_2/core/widgets/custom_textform.dart';
import 'package:flutter_application_2/features/login/widgets/lable_text.dart';
import 'package:flutter_application_2/features/registers/cubit/cubit.dart';
import 'package:flutter_application_2/features/registers/cubit/states.dart';
import 'package:flutter_application_2/features/registers/widgets/school_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit regCubit = BlocProvider.of<RegisterCubit>(context);
    // RegisterCubit regCubit2 = context.read<RegisterCubit>();
    // RegisterCubit regCubit3 = RegisterCubit.get(context);

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Register',
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: regCubit.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(
                            radius: 65.0,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage(
                                'https://cdn.iconscout.com/icon/free/png-512/free-user-1851010-1568997.png?f=webp&w=256',
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    LableText(
                      hederTextLable: "username".tr(),
                      textFormFiled: CustomTextform(
                        controller: regCubit.userController,
                        type: TextInputType.emailAddress,
                        hittext: "username".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.person,
                      ),
                    ),
                    LableText(
                      hederTextLable: "emailaddress".tr(),
                      textFormFiled: CustomTextform(
                        controller: regCubit.emailController,
                        type: TextInputType.emailAddress,
                        hittext: "emailaddress".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.email_outlined,
                      ),
                    ),
                    LableText(
                      hederTextLable: "password".tr(),
                      textFormFiled: CustomTextform(
                        controller: regCubit.passwordController,
                        type: TextInputType.visiblePassword,
                        hittext: "password".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.lock,
                      ),
                    ),
                    LableText(
                      hederTextLable: "telstu".tr(),
                      textFormFiled: CustomTextform(
                        controller: regCubit.telStudentController,
                        type: TextInputType.phone,
                        hittext: "telstu".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.phone,
                      ),
                    ),
                    LableText(
                      hederTextLable: "tel_f".tr(),
                      textFormFiled: CustomTextform(
                        controller: regCubit.telFatherController,
                        type: TextInputType.phone,
                        hittext: "tel_f".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.phone,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: LableText(
                            hederTextLable: "address".tr(),
                            textFormFiled: CustomTextform(
                              controller: regCubit.addressController,
                              type: TextInputType.text,
                              hittext: "address".tr(),
                              borderColor: Colors.black,
                              preFix: Icons.location_city,
                            ),
                          ),
                        ),
                        Expanded(
                          child: LableText(
                            hederTextLable: "area".tr(),
                            textFormFiled: CustomTextform(
                              controller: regCubit.emailController,
                              type: TextInputType.text,
                              hittext: "area".tr(),
                              borderColor: Colors.black,
                              preFix: Icons.location_city,
                            ),
                          ),
                        ),
                      ],
                    ),
                    LableText(
                      hederTextLable: "school".tr(),
                      textFormFiled: CustomTextform(
                        controller: regCubit.scoolController,
                        type: TextInputType.phone,
                        hittext: "school".tr(),
                        borderColor: Colors.black,
                        preFix: Icons.location_city,
                      ),
                    ),
                    const Row(
                      children: [
                        SchoolItem(
                          titelString: 'Government',
                          groupValue: 1,
                        ),
                      ],
                    ),
                    // const CustomDrop(),
                    // const SizedBox(
                    //   height: 30.0,
                    // ),
                    // const CustomDropdowntext(),
                    // const SizedBox(
                    //   height: 100.0,
                    // ),
                    // CustomDropdowntextstell(
                    //   label: "stu_year".tr(),
                    //   hittext: "stu_year".tr(),
                    //   items: regCubit.items,
                    //   onChanged: (value) {
                    //     regCubit.codeStuYear =  regCubit.items.where(test)
                    //   }, itemToString: (Map<String, String> item) {  },
                    // ),

                    CustomDropdowntextstell<Map<String, String>>(
                      items: regCubit.items, // Pass the list of maps
                      label: 'اختر الصف',
                      hittext: 'اختر واحداً',
                      onChanged: (newValue) {
                        regCubit.codeStuYear = int.parse(
                            newValue!['id']!); // Update the selected id
                      },
                      value: regCubit.items.firstWhere(
                        (item) => item['id'] == regCubit.codeStuYear.toString(),
                      ), // Get selected item
                      itemToString: (item) =>
                          item['value']!, // Function to convert item to string
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomBottom(
                      text: "createnewaccount".tr(),
                      onpressed: () {
                        if (regCubit.formkey.currentState!.validate()) {
                          regCubit.addRegister();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
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
