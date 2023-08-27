import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_/presentation/screens/movie_details_screen/movie_details_screen.dart';

import '../../../data/repositories/api/api_constants.dart';

class NowShowing extends StatefulWidget {
  final List<dynamic> movies;
  const NowShowing({Key? key, required this.movies}) : super(key: key);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  List<dynamic> movie = [];

  @override
  void initState() {
    super.initState();

    movie = widget.movies;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.movies.length,
        itemBuilder: (_, i, j) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MovieDetailPage(movie: widget.movies[i])),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: NetworkImage(
                      "${APIUrl.imgBaseUrl}${movie[i].posterPath}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9, // Aspect ratio of each item
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true, // Infinite scroll
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 1),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              print('Page changed to index $index');
            }));
  }
}
