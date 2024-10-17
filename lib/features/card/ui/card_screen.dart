import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card/cubit/card_cubit.dart';
import 'package:flutter_application_2/features/card/ui/item_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardCubit cardCubit = BlocProvider.of(context);

    return BlocConsumer<CardCubit, CardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: (state is! GetCardLoading)
              ? ListView.separated(
                  itemBuilder: (context, index) => ItemCardList(
                      carde: cardCubit.retrievedList[index],
                      cardCubit: cardCubit,
                      index: index),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10.0,
                      ),
                  itemCount: cardCubit.retrievedList.length)
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
