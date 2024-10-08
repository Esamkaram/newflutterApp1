import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/features/card/model/carde_model.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  void addCard(String studentId, int matter, int teacher, String timeTh) async {
    emit(CardLoading());
    Carde newCarde = Carde(
        studentId: studentId,
        teacherId: teacher,
        matterId: matter,
        timeTh: timeTh);

    await CacheHelper.addCardeToList(
        key: ChachKey.studentList, newCarde: newCarde);
  }

  void getCard() {
    // Retrieve the updated list
    List<Carde> retrievedList = CacheHelper.getCardeList(key: 'cardeList');

    // Print retrieved data
    for (var carde in retrievedList) {
      print(
          'Student ID: ${carde.studentId}, Teacher ID: ${carde.teacherId}, Matter ID: ${carde.matterId}, Time: ${carde.timeTh}');
    }
  }
}
