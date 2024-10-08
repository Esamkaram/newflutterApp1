import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/functions/flutter_toast.dart';
import 'package:flutter_application_2/core/network/dio_hleper.dart';
import 'package:flutter_application_2/core/network/end_ponts.dart';
import 'package:flutter_application_2/features/login/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserModel? usermodel;

  void userLogin() async {
    emit(LoginLodingstate());
    Response response =
        await DioHelper.postData(endpont: EndPonts.login, data: {
      "P_TEL_STU": phoneController.text,
      "P_PASS": passwordController.text,
    });
    if (response.statusCode == 200) {
      usermodel = UserModel.fromJson(response.data);
      // print('loginToken');
      // print(usermodel!.data!.token);
      await CacheHelper.saveData(
          key: ChachKey.userToken, value: usermodel!.data!.token);
      await CacheHelper.saveData(
          key: ChachKey.username, value: usermodel!.data!.data!.sTUDENTNAME);
      await CacheHelper.saveData(
          key: ChachKey.userImage, value: usermodel!.data!.data!.sTUDENTImg);
      await CacheHelper.saveData(
          key: ChachKey.stidentId, value: usermodel!.data!.data!.sTUDENTID!);

      showToast(message: 'Login is Success !!', state: ToastStates.sUCCESS);
      emit(LoginSuccessState());
    } else {
      showToast(message: 'Register is Error !!', state: ToastStates.eRROR);
      emit(LoginErrorState());
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
