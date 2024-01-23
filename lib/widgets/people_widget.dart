import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/people_rated_list_response/people_popular_list_response.dart';
import 'dart:convert';
import 'package:flutter_application_10/widgets/people_item.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';

Future<PeoplePopularResponse> fetchPeople() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/popular?api_key=cb240d50801976c6f75926069581b0e3'));

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = json.decode(response.body);
    return PeoplePopularResponse.fromJson(decodedJson);
  } else {
    throw Exception('Failed');
  }
}

class PeopleWidget extends StatefulWidget {
  const PeopleWidget({super.key});

  @override
  State<PeopleWidget> createState() => _PeopleWidgetStateState();
}

class _PeopleWidgetStateState extends State<PeopleWidget> {
  late Future<PeoplePopularResponse> people;

  @override
  void initState() {
    super.initState();
    people = fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<PeoplePopularResponse>(
        future: people,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
              enabled: false,
              child: ListView.builder(
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return PeopleItem(
                    people: snapshot.data!.results![index],
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
