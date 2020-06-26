import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';

class HttpHelper{
  final String urlKey = 'api_key=481b412233241fd4417aae091706c2d7';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?api_key=481b412233241fd4417aae091706c2d7&query=';

Future<List> getUpcoming() async{
  final String upComing = urlBase + urlUpcoming + urlKey + urlLanguage;
  http.Response result = await http.get(upComing);
  var myResult = await http.get(upComing);

  if(result.statusCode == HttpStatus.ok){
    final jsonResponse = json.decode(result.body);
    final moviesMap = jsonResponse['results'];
    List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
    return movies;
  }
  else{
    print('YEAh');
    return null;
    
  } 
}

  Future<List> findMovies(String title) async {
    final String query = urlSearchBase + title ;
    http.Response result = await http.get(query);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }
    else {
      return null;
    }  }


}