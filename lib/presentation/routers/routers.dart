import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_/logic/blocs/now_shows_blocs/bloc/now_showing_bloc.dart';
import 'package:test_/logic/blocs/upcoming_shows_blocs/bloc/upcoming_bloc.dart';
import '../screens/home_screens/home_screen.dart';
import '../widgets/navigation.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<NowShowingBloc>(
                    create: (BuildContext context) => NowShowingBloc(),
                  ),
                  BlocProvider<UpcomingBloc>(
                    create: (BuildContext context) => UpcomingBloc(),
                  ),
                ], child: const MainScreen()));
      case "/home_screen":
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return null;
    }
  }
}
