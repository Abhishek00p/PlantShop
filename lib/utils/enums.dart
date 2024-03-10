enum PlantCategories {
  indoor,
  outdoor,
  succulent,
  herb,
  flowering,
  others,
}

class PlantCategoryEnum {
  static const Map<PlantCategories, String> allCategories =
      <PlantCategories, String>{
    PlantCategories.flowering: 'Flowering',
    PlantCategories.herb: 'Herb',
    PlantCategories.indoor: 'Indoor',
    PlantCategories.outdoor: 'Outdoor',
    PlantCategories.succulent: 'Succulent',
    PlantCategories.others: 'Others',
  };
  static String plantCategory(PlantCategories plantCategory) {
    return allCategories[plantCategory].toString();
  }
}
