import 'package:flutter/material.dart';
import 'package:flutter_application_10/widgets/people_detail_widget.dart';

class PeopleDetail extends StatelessWidget {
  const PeopleDetail({super.key, required this.name, required this.id});
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: PeopleDetailWidget(id: id),
    );
  }
}
