import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantshop/backend/apiCalls/plants_datasource.dart';
import 'package:plantshop/blocs/plant_bloc/plant_state.dart';
import 'package:plantshop/core/error/exception.dart';
import 'package:plantshop/core/hive/hive.dart';

class PlantCubit extends Cubit<PlantState> {
  PlantCubit() : super(GetAllPlantInitialState());

  Future<void> getAllPlants() async {
    emit(GetAllPlantLoadingState());
    final user = HiveBoxes.getUser();
    if (!user.isEmpty) {
      try {
        final plants = await PlantDataSource.getAllPlants();
        emit(GetAllPlantLoadedState(plants: plants));
      } catch (e) {
        emit(GetAllPlantErrorState(exception: e as CustomException));
      }
    }
  }

  Future<void> getPlantById({required String plantId}) async {
    emit(GetPlantByIdLoadingState());
    final user = HiveBoxes.getUser();
    if (!user.isEmpty) {
      try {
        final plant = await PlantDataSource.getPlantById(
            bToken: user.userToken, Id: plantId);
        emit(GetPlantByIdLoadedState(plant: plant));
      } catch (e) {
        emit(GetPlantByIdErrorState(exception: e as CustomException));
      }
    }
  }
}
