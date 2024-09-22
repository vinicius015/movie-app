import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/show_model.dart';
import 'package:movie_app/pages/top_rated_shows/widgets/top_rated_show.dart';
import 'package:movie_app/services/api_services.dart';

class TopRatedShowsPage extends StatefulWidget {
  const TopRatedShowsPage({super.key});

  @override
  State<TopRatedShowsPage> createState() => _TopRatedShowsPageState();
}

class _TopRatedShowsPageState extends State<TopRatedShowsPage> {
  ApiServices apiServices = ApiServices();
  late Future<ShowResult> showsFuture;

  @override
  void initState() {
    showsFuture = apiServices.getTopRatedShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: FutureBuilder(
          future: showsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              final shows = snapshot.data!.shows;
              return ListView.builder(
                itemCount: shows.length,
                itemBuilder: (context, index) {
                  return TopRatedShow(show: shows[index]);
                },
              );
            }

            return const Center(
              child: Text('No data found'),
            );
          }),
    );
  }
}
