part of 'now_showing_bloc.dart';

abstract class NowShowingState extends Equatable {
  const NowShowingState();

  @override
  List<Object> get props => [];
}

class NowShowsLoadingState extends NowShowingState {
  @override
  List<Object> get props => [];
}

class NowShowsLoadedState extends NowShowingState {
  final List<dynamic> movies;

  const NowShowsLoadedState(this.movies);
  @override
  List<Object> get props => [movies];
}

class NowShowsErrorState extends NowShowingState {
  final String error;

  const NowShowsErrorState(this.error);
  @override
  List<Object> get props => [error];
}
