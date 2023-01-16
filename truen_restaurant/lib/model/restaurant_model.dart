class RestaurantModel {
  String? name;
  String? description;
  int? distance;
  bool? isChecked = false;
  String? image = "1";
  int? count = 0;
  RestaurantModel(name, description, distance, image, ) {
    this.name = name;
    this.description = description;
    this.distance = distance;
    this.image = image;
  }
}