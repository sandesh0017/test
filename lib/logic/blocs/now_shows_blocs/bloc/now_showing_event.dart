part of 'now_showing_bloc.dart';

abstract class NowShowingEvent extends Equatable {
  const NowShowingEvent();

  @override
  List<Object> get props => [];
}

class NowShowsFetchEvent extends NowShowingEvent {
  @override
  List<Object> get props => [];
}
