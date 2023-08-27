part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingLoadingState extends UpcomingState {
  @override
  List<Object> get props => [];
}

class UpcomingLoadedState extends UpcomingState {
  final List<dynamic> movies;

  const UpcomingLoadedState(this.movies);
  @override
  List<Object> get props => [movies];
}

class UpcomingErrorState extends UpcomingState {
  final String error;

  const UpcomingErrorState(this.error);
  @override
  List<Object> get props => [error];
}
