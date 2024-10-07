import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/network/dio_hleper.dart';
import 'package:flutter_application_2/core/network/end_ponts.dart';
import 'package:flutter_application_2/features/home/model/matter_model.dart';
import 'package:flutter_application_2/features/home/model/offer_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final TextEditingController searcheController = TextEditingController();
  OfferModel? offerModel;
  MatterModel? matterModel;

  void getHomeOfffers() async {
    emit(HomeLodingstate());
    Response response = await DioHelper.getData(
        endpont: EndPonts.getOffer,
        token: CacheHelper.getDate(key: ChachKey.userToken));
    if (response.statusCode == 200) {
      offerModel = OfferModel.fromJson(response.data);
      await getHomeMatter();
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }

  Future getHomeMatter() async {
    // emit(MatterLodingstate());
    Response responseMatter = await DioHelper.getData(
        endpont: EndPonts.getMatterList,
        token: CacheHelper.getDate(key: ChachKey.userToken));
    if (responseMatter.statusCode == 200) {
      matterModel = MatterModel.fromJson(responseMatter.data);
      // emit(MatterSuccessState());
    } else {
      // emit(MatterErrorState());
    }
  }

  @override
  Future<void> close() {
    searcheController.dispose();

    return super.close();
  }
}
