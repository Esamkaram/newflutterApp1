part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardLoading extends CardState {}

final class CardSuccessStates extends CardState {}

final class CardErrorStates extends CardState {}

final class GetCardLoading extends CardState {}

final class GetCardSuccessStates extends CardState {}



final class RemoveItemSuccessStates extends CardState {}