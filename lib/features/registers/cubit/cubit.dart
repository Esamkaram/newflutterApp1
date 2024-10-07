import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/functions/flutter_toast.dart';
import 'package:flutter_application_2/core/network/dio_hleper.dart';
import 'package:flutter_application_2/core/network/end_ponts.dart';
import 'package:flutter_application_2/features/registers/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegsterInitState());

  static get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telStudentController = TextEditingController();
  final TextEditingController telFatherController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController scoolController = TextEditingController();
  final TextEditingController typeScoolController = TextEditingController();
  final TextEditingController stuYearController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController barthDayController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  int? codeStuYear = 1;

  final List<Map<String, String>> items = [
    {'id': '1', 'value': 'الصف الاول الثانوي'},
    {'id': '2', 'value': 'الصف الثاني الثانوي'},
    {'id': '3', 'value': 'الصف الثالث الثانوي'},
  ];

  @override
  Future<void> close() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    telStudentController.dispose();
    telFatherController.dispose();
    addressController.dispose();
    areaController.dispose();
    scoolController.dispose();
    typeScoolController.dispose();
    stuYearController.dispose();
    sectionController.dispose();
    barthDayController.dispose();
    ageController.dispose();

    return super.close();
  }

  void addRegister() async {
    emit(RegsterLodingState());
    Response response =
        await DioHelper.postData(endpont: EndPonts.register, data: {
      "student_name": userController.text,
      "tel_stu": telStudentController.text,
      "school_name": scoolController.text,
      "pass": passwordController.text,
      "STU_YEAR": stuYearController.text,
      "TEL_PHONE_F": telFatherController.text,
      "BRTH_DATE": barthDayController.text,
      "STU_LNG": 1
    });
    if (response.statusCode == 200) {
      showToast(message: 'Login is Success !!', state: ToastStates.sUCCESS);
      emit(RegisterSuccessState());
    } else {
      showToast(message: 'Register is Error !!', state: ToastStates.eRROR);
      emit(RegisterErrorState());
    }
  }
}
