import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/network/dio_hleper.dart';
import 'package:flutter_application_2/core/network/end_ponts.dart';
import 'package:flutter_application_2/features/teacher_schedule/model/schedule_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());
  ScheduleModel? scheduleModel;

  void getScheduleteacher({
    required int tea , required int matt 
  }) async {
    emit(ScheduleLodingstate());
    Response response = await DioHelper.getData(
        endpont: EndPonts.getTeacherProfile,
        query: {"tea": tea , "matt": matt },
        token: CacheHelper.getDate(key: ChachKey.userToken));
    if (response.statusCode == 200) {
      scheduleModel = ScheduleModel.fromJson(response.data);
      print(scheduleModel);
      emit(ScheduleSuccessState());
    } else {
      emit(ScheduleErrorState());
    }
  }
}
