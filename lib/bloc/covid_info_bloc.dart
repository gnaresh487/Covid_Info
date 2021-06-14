import 'package:bloc/bloc.dart';
import 'package:covid_latest_info/bloc/covid_info_event.dart';
import 'package:covid_latest_info/bloc/covid_info_state.dart';
import 'package:covid_latest_info/model/covid_info_model.dart';
import 'package:covid_latest_info/repo/covid_info_repo.dart';
import 'package:flutter/material.dart';

class CovidInfoBloc extends Bloc<CovidInfoEvent, CovidInfoState> {
  final CovidInfoRepo repository;

  CovidInfoBloc({@required this.repository}) : assert(repository != null), super(null);

  CovidInfoState get initialState => CovidInfoEmpty();

  @override
  Stream<CovidInfoState> mapEventToState(CovidInfoEvent event) async* {
    if (event is FetchCovidInfo) {
      yield CovidInfoLoading();
      try {
        final CovidInfoModel covidInfo = await repository?.getCovidSummery();
        yield CovidInfoLoaded(covidInfo: covidInfo,);
      } catch (error) {
        debugPrint('state error $error');
        yield CovidInfoError();
      }
    }
    if (event is UpdateClickedWidget){
      yield CovidInfoUpdate();
    }
  }
}
