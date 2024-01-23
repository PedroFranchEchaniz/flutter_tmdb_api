import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/people_detail_response/people_detail_response.dart';
import 'package:flutter_application_10/widgets/people_detail_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:skeletonizer/skeletonizer.dart';

Future<PeopleDetailResponse> fetchPeopleDetails(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/$id?api_key=cb240d50801976c6f75926069581b0e3'));

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = json.decode(response.body);
    return PeopleDetailResponse.fromJson(decodedJson);
  } else {
    throw Exception('Failed');
  }
}

class PeopleDetailWidget extends StatefulWidget {
  const PeopleDetailWidget({super.key, required this.id});
  final int id;

  @override
  State<PeopleDetailWidget> createState() => _PeopleDetailWidgetState();
}

class _PeopleDetailWidgetState extends State<PeopleDetailWidget> {
  late Future<PeopleDetailResponse> peopleDetail;

  @override
  void initState() {
    super.initState();
    peopleDetail = fetchPeopleDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<PeopleDetailResponse>(
        future: peopleDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
              enabled: false,
              child: PeopleDetailItem(people: snapshot.data!),
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
