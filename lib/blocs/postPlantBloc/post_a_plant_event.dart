part of 'post_a_plant_bloc.dart';

@immutable
sealed class PostAPlantEvent {}

class CreateAPlant extends PostAPlantEvent {
  final String plantName;
  final double priceOfPlant;
  final int quantity;
  final String categoryOfPlant;

  CreateAPlant({
    required this.plantName,
    required this.priceOfPlant,
    required this.quantity,
    required this.categoryOfPlant,
  });
}
