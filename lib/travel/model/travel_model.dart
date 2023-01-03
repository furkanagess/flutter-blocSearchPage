class TravelModel {
  final String title;
  final String subTitle;
  final String imageName;

  TravelModel(
      {required this.title, required this.subTitle, required this.imageName});

  String get imagePath => "assets/images/$imageName.png";

  static final List<TravelModel> mockItems = [
    TravelModel(
        title: "Paris", subTitle: "Eiffel Tower", imageName: "eiffel_tower"),
    TravelModel(
        title: "Dubai", subTitle: "Burj Khalifa", imageName: "burj_khalifa"),
    TravelModel(
        title: "Peru", subTitle: "Machu Picchu", imageName: "machu_pichu"),
  ];
}
