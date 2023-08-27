import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/repositories/now_shows_repo.dart';

part 'now_showing_event.dart';
part 'now_showing_state.dart';

class NowShowingBloc extends Bloc<NowShowingEvent, NowShowingState> {
  NowShowingBloc() : super(NowShowsLoadingState()) {
    on<NowShowsFetchEvent>((NowShowsFetchEvent event, Emitter emit) async {
      NowShowsRepository nowShowsRepository = NowShowsRepository();
      try {
        List<dynamic> nowShowsEvent = await nowShowsRepository.fetchData();
        emit(NowShowsLoadedState(nowShowsEvent));
      } catch (e) {
        emit(NowShowsErrorState(e.toString()));
      }
    });
  }
}
