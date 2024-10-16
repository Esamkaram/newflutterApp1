import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/features/card/model/carde_model.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  void addCard(String studentId, int matter, int teacher, String timeTh,
      int dayId, String dayName, String teacherName) async {
    emit(CardLoading());
    Carde newCarde = Carde(
        studentId: studentId,
        teacherId: teacher,
        matterId: matter,
        timeTh: timeTh,
        dayID: dayId,
        dayName: dayName,
        teacherName: teacherName);

    await CacheHelper.addCardeToList(
        key: ChachKey.studentList, newCarde: newCarde);
    await getCard();
    emit(CardSuccessStates());
  }

  List<Carde> retrievedList = [];

  Future<void> getCard() async {
    // Retrieve the updated list
    emit(getCardLoading());
    retrievedList = await CacheHelper.getCardeList(key: ChachKey.studentList);

    emit(getCardSuccessStates());
    print(retrievedList.length);
    // Print retrieved data
    for (var carde in retrievedList) {
      print(
          'Student ID: ${carde.studentId}, Teacher ID: ${carde.teacherId}, Matter ID: ${carde.matterId}, Time: ${carde.timeTh} , Day ID: ${carde.dayID} , Day Name: ${carde.dayName} , Teacher Name : ${carde.teacherName} ');
    }
  }
}
