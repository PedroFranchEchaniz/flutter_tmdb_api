import 'package:flutter/material.dart';
import 'package:flutter_application_10/widgets/movie_item.dart';
import 'dart:convert';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:flutter_application_10/models/movie_rated_list_response/movie_rated_list_response.dart';
import 'package:http/http.dart' as http;

Future<MovieListResponse> fetchMovie() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=cb240d50801976c6f75926069581b0e3'));

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = json.decode(response.body);

    return MovieListResponse.fromJson(decodedJson);
  } else {
    throw Exception('Failed');
  }
}

class MovieWidget extends StatefulWidget {
  const MovieWidget({super.key});

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  late Future<MovieListResponse> movie;

  @override
  void initState() {
    super.initState();
    movie = fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<MovieListResponse>(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
              enabled: false,
              child: ListView.builder(
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return MovieItem(
                    movie: snapshot.data!.results![index],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
