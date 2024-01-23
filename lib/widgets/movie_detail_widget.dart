import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/movie_detail_response/movie_detail_response.dart';
import 'package:flutter_application_10/widgets/movie_detail_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skeletonizer/skeletonizer.dart';

// ignore: non_constant_identifier_names
Future<MovieDetailResponse> fetchMovieDetails(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=cb240d50801976c6f75926069581b0e3'));
  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = json.decode(response.body);
    return MovieDetailResponse.fromJson(decodedJson);
  } else {
    throw Exception('Failed');
  }
}

class ModiveDetailWidget extends StatefulWidget {
  const ModiveDetailWidget({super.key, required this.id});
  final int id;

  @override
  State<ModiveDetailWidget> createState() => _ModiveDetailWidgetState();
}

class _ModiveDetailWidgetState extends State<ModiveDetailWidget> {
  late Future<MovieDetailResponse> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = fetchMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<MovieDetailResponse>(
        future: movieDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
              enabled: false,
              child: MovieDetailItem(movie: snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
