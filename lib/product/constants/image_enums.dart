enum ImageEnums {
  eiffel_tower,
  burj_khalifa,
  machu_pichu,
}

extension ImageEnumsExtension on ImageEnums {
  String get toPath => "assets/images/$name.png";
}
