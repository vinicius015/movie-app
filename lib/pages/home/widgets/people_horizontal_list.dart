import 'package:flutter/material.dart';
import 'package:movie_app/models/person_model.dart';
import 'package:movie_app/pages/home/widgets/person_horizontal_item.dart';

class PeopleHorizontalList extends StatelessWidget {
  final List<Person> people;
  const PeopleHorizontalList({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: people.length,
        itemBuilder: (context, index) {
          return PersonHorizontalItem(person: people[index]);
        },
      ),
    );
  }
}
