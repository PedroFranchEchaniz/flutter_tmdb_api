import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/movie_rated_list_response/movie_rated_list_response.dart';
import 'package:flutter_application_10/screen/movie_detail_screen.dart';

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
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => MovieDetail(
                    name: movie.title!,
                    id: movie.id!,
                  ),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: 200,
                height: 320,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.themoviedb.org/t/p/w500${movie.posterPath}',
                        width: 200,
                      ),
                      Text(
                        movie.title!,
                        style: TextStyle(height: 2, fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
