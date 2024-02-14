import 'package:plantshop/core/error/exception.dart';
import 'package:plantshop/models/plant_model.dart';

sealed class PlantState {}

class GetAllPlantState extends PlantState {}

class GetAllPlantInitialState extends GetAllPlantState {}

class GetAllPlantLoadingState extends GetAllPlantState {}

class GetAllPlantLoadedState extends GetAllPlantState {
  GetAllPlantLoadedState({required this.plants});
  final List<PlantModel> plants;
}

class GetAllPlantErrorState extends GetAllPlantState {
  GetAllPlantErrorState({required this.exception});
  final CustomException exception;
}

class GetPlantByIdState extends PlantState {}

class GetPlantByIdInitialState extends GetPlantByIdState {}

class GetPlantByIdLoadingState extends GetPlantByIdState {}

class GetPlantByIdLoadedState extends GetPlantByIdState {
  GetPlantByIdLoadedState({required this.plant});
  final PlantModel plant;
}

class GetPlantByIdErrorState extends GetPlantByIdState {
  GetPlantByIdErrorState({required this.exception});
  final CustomException exception;
}
