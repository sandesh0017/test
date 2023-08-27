import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_/logic/blocs/now_shows_blocs/bloc/now_showing_bloc.dart';
import 'package:test_/logic/blocs/upcoming_shows_blocs/bloc/upcoming_bloc.dart';
import 'package:test_/presentation/screens/home_screens/widgets/animation_film_section.dart';
import 'package:test_/presentation/screens/home_screens/widgets/header_content.dart';
import 'package:test_/presentation/screens/home_screens/widgets/now_showing_section.dart';

import '../../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NowShowingBloc>(context).add(NowShowsFetchEvent());
    BlocProvider.of<UpcomingBloc>(context).add(UpcomingFetchEvent());
    super.initState();
  }

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backGroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              HeaderContent(),
              SizedBox(
                height: 20,
              ),
              NowShowingSection(),
              SizedBox(
                height: 20,
              ),
              AnimationFilmSection()
            ]),
          ),
        ),
      ),
    );
  }
}
