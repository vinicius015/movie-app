import 'dart:convert';

class ShowResult {
  int page;
  List<Show> shows;
  int totalPages;
  int totalResults;

  ShowResult({
    required this.page,
    required this.shows,
    required this.totalPages,
    required this.totalResults,
  });

    factory ShowResult.fromRawJson(String str) => ShowResult.fromJson(json.decode(str));

  factory ShowResult.fromJson(Map<String, dynamic> json) => ShowResult(
        page: json["page"],
        shows:
            List<Show>.from(json["results"].map((x) => Show.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Show {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  Show({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Show.fromRawJson(String str) => Show.fromJson(json.decode(str));

  factory Show.fromJson(Map<String, dynamic> json) => Show(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'] ?? 0,
      originCountry: List<String>.from(json['origin_country'] ?? []),
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] ?? '',
      firstAirDate: DateTime.tryParse(json['first_air_date'] ?? ''),
      name: json['name'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0);
}
