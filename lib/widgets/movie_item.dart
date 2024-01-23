import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/movie_rated_list_response/movie_rated_list_response.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: SizedBox(
                  width: 900,
                  height: 650,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://www.themoviedb.org/t/p/w500${movie.posterPath}',
                            width: double.infinity,
                          ),
                          Text(
                            movie.title!,
                            style: TextStyle(height: 2, fontSize: 30),
                          )
                        ],
                      )),
                ))),
      ),
    );
  }
}
