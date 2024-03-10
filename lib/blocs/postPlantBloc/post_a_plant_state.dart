part of 'post_a_plant_bloc.dart';

@immutable
sealed class PostAPlantState {}

final class PostAPlantInitial extends PostAPlantState {}

final class PostAPlantLoading extends PostAPlantState {}

final class PostAPlantError extends PostAPlantState {
  PostAPlantError(this.exception);
  final CustomException exception;
}

final class PostAPlantLoaded extends PostAPlantState {}
