part of 'data_fetch_bloc.dart';

@immutable
sealed class DataFetchState {}

final class DataFetchInitial extends DataFetchState {}

class SuccessFetch extends DataFetchState {
  final List<Userdata> userdata;

  SuccessFetch({required this.userdata});
}

class FailedFetch extends DataFetchState {}

class ErrorFetch extends DataFetchState {
  final String message;

  ErrorFetch({required this.message});
}

class Loading extends DataFetchState {}
