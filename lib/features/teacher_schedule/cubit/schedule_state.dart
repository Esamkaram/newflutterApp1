part of 'schedule_cubit.dart';

sealed class ScheduleState {}

final class ScheduleInitial extends ScheduleState {}

class ScheduleLodingstate extends ScheduleState {}

class ScheduleSuccessState extends ScheduleState {}

class ScheduleErrorState extends ScheduleState {}
