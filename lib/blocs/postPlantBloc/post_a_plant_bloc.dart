import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plantshop/backend/apiCalls/plants_datasource.dart';
import 'package:plantshop/core/error/exception.dart';

part 'post_a_plant_event.dart';
part 'post_a_plant_state.dart';

class PostAPlantBloc extends Bloc<PostAPlantEvent, PostAPlantState> {
  PostAPlantBloc() : super(PostAPlantInitial()) {
    on<PostAPlantEvent>((event, emit) async {
      if (event is CreateAPlant) {
        emit(PostAPlantLoaded());
        try {
          final response = await PlantDataSource.creatAPlant(
              plantName: event.plantName,
              priceOfPlant: event.priceOfPlant,
              quantity: event.quantity,
              categoryOfPlant: event.categoryOfPlant);

          if (response) {
            emit(PostAPlantLoaded());
          } else {
            emit(PostAPlantError(
                CustomException('Posting a plant was unsuccessfull...')));
          }
        } catch (e) {
          emit(PostAPlantError(e as CustomException));
        }
      }
    });
  }
}
