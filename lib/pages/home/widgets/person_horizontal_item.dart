import 'package:flutter/material.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/person_model.dart';
import 'package:movie_app/pages/person_details/person_details_page.dart';

class PersonHorizontalItem extends StatelessWidget {
  const PersonHorizontalItem({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PersonDetailsPage(personId: person.id,))
            )
          },
          child: Container(
            height: 200,
            width: 140,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('$imageUrl${person.profilePath}'),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15,
          right: 15,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                person.name,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    person.knownForDepartment,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.popularity.toInt().toString(),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.show_chart,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
