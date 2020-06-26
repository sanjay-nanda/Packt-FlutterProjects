class Movie{
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String overview;
  String posterPath;

  Movie({this.id, this.overview, this.posterPath, this.releaseDate, this.title, this.voteAverage});

    Movie.fromJson(Map<String, dynamic> parsedJson){
      this.id = parsedJson['id'];
      this.title = parsedJson['title'];
      this.voteAverage = parsedJson['vote_average']*1.0;
      this.releaseDate = parsedJson['release_date'];
      this.overview = parsedJson['overview'];
      this.posterPath = parsedJson['poster_path'];
    }
}