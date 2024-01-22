import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/movie_rated_list_response/movie_rated_list_response.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}'),
    );
  }
}
