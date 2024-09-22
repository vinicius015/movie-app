import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/person_model.dart';
import 'package:movie_app/services/api_services.dart';

class PersonDetailsPage extends StatefulWidget {
  final int personId;
  const PersonDetailsPage({super.key, required this.personId});

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  ApiServices apiServices = ApiServices();

  late Future<Person> person;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    person = apiServices.getPopularPerson(widget.personId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: person,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final person = snapshot.data;

              String alsoKnownAsText =
                  person!.alsoKnownAs.map((alias) => alias).join(', ');

              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "$imageUrl${person!.profilePath}"),
                                fit: BoxFit.cover)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            person.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          const Text(
                            'Known for: ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            person.knownForDepartment,
                            style: const TextStyle(
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey,
                            ),
                          ),
                        ]),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              'Birhtday: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(person.birthday!)
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Birhtplace: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              person.placeOfBirth,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Biography:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          person.biography,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Also Known As:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          alsoKnownAsText,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
