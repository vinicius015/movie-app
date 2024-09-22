import 'dart:convert';

class PeopleResult {
  int page;
  List<Person> people;
  int totalPages;
  int totalResults;

  PeopleResult({
    required this.page,
    required this.people,
    required this.totalPages,
    required this.totalResults,
  });

  factory PeopleResult.fromRawJson(String str) => PeopleResult.fromJson(json.decode(str));

  factory PeopleResult.fromJson(Map<String, dynamic> json) => PeopleResult(
        page: json["page"],
        people:
            List<Person>.from(json["results"].map((x) => Person.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Person {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  DateTime? birthday;
  DateTime? deathday;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  Person({
      required this.adult,
      required this.alsoKnownAs,
      required this.biography,
      required this.birthday,
      required this.deathday,
      required this.gender,
      required this.id,
      required this.knownForDepartment,
      required this.name,
      required this.placeOfBirth,
      required this.popularity,
      required this.profilePath
  });

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    adult: json['adult'] ?? false,
    alsoKnownAs: json['also_known_as'] != null 
      ? List<String>.from(json['also_known_as']) 
      : [],
    biography: json['biography'] ?? '',
    birthday: DateTime.tryParse(json["birthday"] ?? ''),
    deathday: DateTime.tryParse(json["deathday"] ?? ''),
    gender: json['gender'] ?? 0,
    id: json['id'] ?? 0,
    knownForDepartment: json['known_for_department'] ?? '',
    name: json['name'] ?? '',
    placeOfBirth: json['place_of_birth'] ?? '',
    popularity: json['popularity'].toDouble() ?? 0.0,
    profilePath: json['profile_path'] ?? '',
  );
}
