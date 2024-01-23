import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/people_detail_response/people_detail_response.dart';

class PeopleDetailItem extends StatelessWidget {
  const PeopleDetailItem({super.key, required this.people});

  final PeopleDetailResponse people;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: NetworkImage(
                'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${people.profilePath!}'),
          )
        ],
      ),
    );
  }
}
