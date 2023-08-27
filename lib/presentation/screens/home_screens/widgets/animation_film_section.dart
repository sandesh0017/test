import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_/logic/blocs/now_shows_blocs/bloc/now_showing_bloc.dart';
import 'package:test_/presentation/constants/app_colors.dart';
import 'package:test_/presentation/screens/home_screens/now_showing.dart';
import 'package:test_/presentation/widgets/texts/normal_text.dart';
import 'package:test_/presentation/widgets/texts/sub_title.dart';

class AnimationFilmSection extends StatefulWidget {
  const AnimationFilmSection({super.key});

  @override
  State<AnimationFilmSection> createState() => _AnimationFilmSectionState();
}

class _AnimationFilmSectionState extends State<AnimationFilmSection> {
  List<dynamic> newList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubTitleText(
              firstText: "Animation",
              secondText: " Film",
              colors: AppColor.whiteColor,
            ),
            NormalText(
              text: "See more",
              textColor: AppColor.whiteColor,
              size: 12,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<UpcomingBloc, UpcomingState>(
          builder: (context, state) {
            if (state is UpcomingLoadingState) {
              return const Center(
                  child: CupertinoActivityIndicator(
                color: Colors.white70,
              ));
            } else if (state is UpcomingLoadedState) {
              return Column(
                children: [
                  SearchWidget(
                    filteredList: state.movies,
                    onChange: (query) {
                      setState(() {
                        newList = state.movies
                            .where((item) => item.title!
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList();
                        // log('${newList[0].title}searchList=====$query');
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<NowShowingBloc>(context),
                    child: AnimationFilm(
                        movies: newList.isNotEmpty ? newList : state.movies),
                  ),
                ],
              );
            } else {
              return const Text("An Error");
            }
          },
        )
      ],
    );
  }
}
