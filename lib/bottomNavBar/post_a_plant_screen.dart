import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:plantshop/blocs/postPlantBloc/post_a_plant_bloc.dart';
import 'package:plantshop/custom_sized_boxex.dart';
import 'package:plantshop/utils/custom_snackbar.dart';
import 'package:plantshop/utils/enums.dart';

class PostAPlantScreenProvider extends StatelessWidget {
  const PostAPlantScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostAPlantBloc(),
      child: PostAPlantScreen(),
    );
  }
}

class PostAPlantScreen extends StatefulWidget {
  const PostAPlantScreen({super.key});

  @override
  State<PostAPlantScreen> createState() => _PostAPlantScreenState();
}

class _PostAPlantScreenState extends State<PostAPlantScreen> {
  final plantNameController = TextEditingController();
  final plantCategoryController = TextEditingController();
  final plantPriceController = TextEditingController();
  final plantQuantityController = TextEditingController();

  final List<String> plantCategories = [];

  @override
  void initState() {
    super.initState();
    plantCategoryController.value =
        TextEditingValue(text: PlantCategories.indoor.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostAPlantBloc, PostAPlantState>(
      listener: (context, state) {
        if (state is PostAPlantLoaded) {
          CustomSnackBar.successSnackbar(
              context: context, message: 'Successfully posted a plant');
        } else if (state is PostAPlantError) {
          CustomSnackBar.failureSnackbar(
              context: context, message: state.exception.message);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBoxHeight10,
              Align(alignment: Alignment.center, child: Text('Post A Plant')),
              SizedBoxWidth50,
              Text('Plant Name'),
              SizedBoxHeight10,
              SizedBox(
                height: 60,
                child: TextField(
                  controller: plantNameController,
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ],
                  decoration: InputDecoration(
                      hintText: 'Enter a Plant Name',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBoxHeight15,
              Text('Plant Quantity'),
              SizedBoxHeight10,
              SizedBox(
                height: 60,
                child: TextField(
                  controller: plantQuantityController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      hintText: '2', border: OutlineInputBorder()),
                ),
              ),
              SizedBoxWidth15,
              Text('Plant Category'),
              SizedBoxHeight10,
              SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButton(
                        value: plantCategoryController.text,
                        isExpanded: true,
                        items: PlantCategories.values
                            .map((e) => DropdownMenuItem(
                                  child: Text('${e.name}'),
                                  value: PlantCategoryEnum.plantCategory(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            plantCategoryController.value =
                                TextEditingValue(text: value);
                          }
                        }),
                  )),
              SizedBoxWidth15,
              Text('Plant price'),
              SizedBoxHeight10,
              SizedBox(
                height: 60,
                child: TextField(
                  controller: plantPriceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp("[a-zA-Z]")),
                  ],
                  decoration: InputDecoration(
                      hintText: '500', border: OutlineInputBorder()),
                ),
              ),
              SizedBoxHeight30,
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: gren,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 16)),
                    onPressed: () {
                      PostAPlantBloc().add(CreateAPlant(
                          plantName: plantNameController.text,
                          priceOfPlant: double.parse(plantPriceController.text),
                          quantity: int.parse(plantQuantityController.text),
                          categoryOfPlant: plantCategoryController.text));
                    },
                    child: Text('Post Plant')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
