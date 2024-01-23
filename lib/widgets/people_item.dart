import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/people_rated_list_response/people_popular_list_response.dart';
import 'package:flutter_application_10/screen/people_datail_screen.dart';

class PeopleItem extends StatelessWidget {
  const PeopleItem({super.key, required this.people});

  final People people;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // Se eliminó clipBehavior
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => PeopleDetail(
                  name: people.name!,
                  id: people.id!,
                ),
              ),
            );
          },
          child: SizedBox(
            width: 200,
            height: 320,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    'https://www.themoviedb.org/t/p/w500${people.profilePath}',
                    width: 200,
                  ),
                  Text(
                    people.name!,
                    style: const TextStyle(height: 2, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
