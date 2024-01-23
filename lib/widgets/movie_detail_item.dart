import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/movie_detail_response/movie_detail_response.dart';

class MovieDetailItem extends StatelessWidget {
  const MovieDetailItem({super.key, required this.movie});

  final MovieDetailResponse movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(
                  'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${movie.posterPath!}'),
            )
          ],
        ),
      ),
    );
  }
}
