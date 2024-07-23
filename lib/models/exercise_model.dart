class ExerciseModel {
  String id;
  String name;
  String training;
  String howMake;

  String? urlImage;

  ExerciseModel(
      {required this.id,
      required this.name,
      required this.training,
      required this.howMake});

  ExerciseModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        training = map['training'],
        howMake = map['howMake'],
        urlImage = map['urlImage'];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "training": training,
      "howMake": howMake,
      "urlImage": urlImage
    };
  }
}
