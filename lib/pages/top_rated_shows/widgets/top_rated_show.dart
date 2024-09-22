import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/show_model.dart';

class TopRatedShow extends StatelessWidget {
  const TopRatedShow({
    super.key,
    required this.show,
  });

  final Show show;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('$imageUrl${show.posterPath}')),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  show.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  show.firstAirDate == null
                      ? ''
                      : DateFormat("d 'de' MMM 'de' y")
                          .format(show.firstAirDate!),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.rate_review,
                      color: Colors.yellow,
                      size: 15,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${show.voteAverage.toStringAsFixed(1)}/10',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
