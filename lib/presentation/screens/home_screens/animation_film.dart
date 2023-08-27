import 'package:flutter/material.dart';
import 'package:test_/presentation/screens/movie_details_screen/movie_details_screen.dart';

import '../../../data/repositories/api/api_constants.dart';

class AnimationFilm extends StatefulWidget {
  final List<dynamic> movies;
  const AnimationFilm({super.key, required this.movies});

  @override
  State<AnimationFilm> createState() => _AnimationFilmState();
}

class _AnimationFilmState extends State<AnimationFilm> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.6,
          child: GridView.builder(
              itemCount: widget.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                var movies = widget.movies[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MovieDetailPage(movie: widget.movies[index])),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    height: height / 4,
                    width: width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                            "${APIUrl.imgBaseUrl}${movies.posterPath}"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
