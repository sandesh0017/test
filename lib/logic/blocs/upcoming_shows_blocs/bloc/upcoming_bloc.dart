import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/repositories/upcomping_movie_repo.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingLoadingState()) {
    on<UpcomingFetchEvent>((UpcomingFetchEvent event, Emitter emit) async {
      UpcomingRepository upcomingRepository = UpcomingRepository();
      try {
        List<dynamic> nowShowsEvent = await upcomingRepository.fetchData();
        emit(UpcomingLoadedState(nowShowsEvent));
      } catch (e) {
        emit(UpcomingErrorState(e.toString()));
      }
    });
  }
}
