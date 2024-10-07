import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/network/dio_hleper.dart';
import 'package:flutter_application_2/core/network/end_ponts.dart';
import 'package:flutter_application_2/features/teacher_schedule/model/schedule_model.dart';
import 'package:meta/meta.dart';

part 'schedule_state.dart';

ScheduleModel? scheduleModel;

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  void getScheduleteacher() async {
    emit(ScheduleLodingstate());
    Response response = await DioHelper.getData(
        endpont: EndPonts.getTeacherProfile,
        query: {"tea": '160', "matt": '1'},
        token: CacheHelper.getDate(key: ChachKey.userToken));
    if (response.statusCode == 200) {
      scheduleModel = ScheduleModel.fromJson(response.data);
      emit(ScheduleSuccessState());
    } else {
      emit(ScheduleErrorState());
    }
  }
}
