part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLodingstate extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class MatterLodingstate extends HomeState {}

class MatterSuccessState extends HomeState {}

class MatterErrorState extends HomeState {}
