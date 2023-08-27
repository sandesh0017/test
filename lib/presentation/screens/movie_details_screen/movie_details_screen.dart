import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_/data/models/upcoming_movie_model.dart';
import 'package:test_/data/repositories/api/api_constants.dart';
import 'package:test_/presentation/constants/app_colors.dart';

class MovieDetailPage extends StatefulWidget {
  final UpcomingMovieModel movie;

  const MovieDetailPage({
    super.key,
    required this.movie,
  });
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  UpcomingMovieModel? movie;
  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    widget.movie.backdropPath == null
                        ? Image.asset(
                            'assets/images/na.jpg',
                            fit: BoxFit.cover,
                          )
                        : FadeInImage(
                            width: double.infinity,
                            height: double.infinity,
                            image: NetworkImage(
                                "${APIUrl.imgBaseUrl}${widget.movie.posterPath}"),
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                          ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 13, 5, 43),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 125, 16, 16),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: Colors.black87,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          widget.movie.title!,
                                          style: const TextStyle(
                                              color: Colors.white70),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                (movie?.voteAverage ?? 3.5)
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: Colors.white70,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          movie?.overview ?? noDesc,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        infoWidget(
                                            title: 'Popularity',
                                            value:
                                                movie?.popularity.toString()),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        infoWidget(
                                            title: 'Release Date',
                                            value:
                                                movie?.releaseDate.toString()),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        infoWidget(
                                            title: 'Vote Count', value: "1152"),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        infoWidget(
                                            title: 'Adult',
                                            value: movie?.adult.toString()),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 40,
                        child: Hero(
                          tag: movie?.id ?? 0,
                          child: SizedBox(
                            width: 100,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: widget.movie.posterPath == null
                                  ? Image.asset(
                                      'assets/images/na.jpg',
                                      fit: BoxFit.cover,
                                    )
                                  : FadeInImage(
                                      image: NetworkImage(
                                          '${APIUrl.imgBaseUrl}${movie?.posterPath}'),
                                      fit: BoxFit.cover,
                                      placeholder: const AssetImage(
                                          'assets/images/marvel.png'),
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Align infoWidget({
    String? title,
    String? value,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
            text: '$title   ',
            style: const TextStyle(color: Colors.white70, fontSize: 15),
            children: [
              TextSpan(
                text: value.toString(),
                style: const TextStyle(color: Colors.white70, fontSize: 17),
              )
            ]),
        textAlign: TextAlign.left,
      ),
    );
  }
}
