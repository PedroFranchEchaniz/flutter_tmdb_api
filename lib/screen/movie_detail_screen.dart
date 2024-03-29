import 'package:flutter/material.dart';
import 'package:flutter_application_10/widgets/movie_detail_widget.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key, required this.title, required this.id});
  final String title;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: ModiveDetailWidget(id: id),
    );
  }
}
