import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:mechine_test_playspots/model/user_model.dart';
import 'package:mechine_test_playspots/utils/api_repository.dart';
import 'package:meta/meta.dart';
part 'data_fetch_event.dart';
part 'data_fetch_state.dart';

Apirepository apirepository = Apirepository();

class DataFetchBloc extends Bloc<DataFetchEvent, DataFetchState> {
  DataFetchBloc() : super(DataFetchInitial()) {
    on<Datafetch>(fetchingData);
  }

  FutureOr<void> fetchingData(
      Datafetch event, Emitter<DataFetchState> emit) async {
    late List<Userdata> userdata;
    emit(Loading());
    try {
      final Response response = await apirepository.exchangedata();

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        userdata = userdataFromMap(result);

        emit(SuccessFetch(userdata: userdata));
      } else {
        emit(FailedFetch());
      }
    } catch (e) {
      emit(ErrorFetch(message: e.toString()));
    }
  }
}
