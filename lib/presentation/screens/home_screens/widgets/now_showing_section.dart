import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_/logic/blocs/now_shows_blocs/bloc/now_showing_bloc.dart';
import 'package:test_/presentation/constants/app_colors.dart';
import 'package:test_/presentation/screens/home_screens/now_showing.dart';
import 'package:test_/presentation/widgets/texts/normal_text.dart';
import 'package:test_/presentation/widgets/texts/sub_title.dart';

class NowShowingSection extends StatelessWidget {
  const NowShowingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubTitleText(
              firstText: "Now",
              secondText: " Showing",
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
        BlocBuilder<NowShowingBloc, NowShowingState>(
          builder: (context, state) {
            if (state is NowShowsLoadingState) {
              return const Center(
                  child: CupertinoActivityIndicator(
                color: Colors.white70,
              ));
            } else if (state is NowShowsLoadedState) {
              return Column(
                children: [
                  BlocProvider.value(
                    value: BlocProvider.of<NowShowingBloc>(context),
                    child: NowShowing(movies: state.movies),
                  ),
                ],
              );
            } else {
              return const Text("An Error");
            }
          },
        ),
      ],
    );
  }
}
