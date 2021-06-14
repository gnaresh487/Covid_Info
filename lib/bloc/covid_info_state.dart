import 'package:covid_latest_info/model/covid_info_model.dart';
import 'package:flutter/material.dart';

abstract class CovidInfoState {
  const CovidInfoState();

  @override
  List<Object> get props => [];
}

class CovidInfoEmpty extends CovidInfoState {}

class CovidInfoLoading extends CovidInfoState {}

class CovidInfoLoaded extends CovidInfoState {
  final CovidInfoModel covidInfo;

  const CovidInfoLoaded({@required this.covidInfo}) : assert(covidInfo != null);

  @override
  List<Object> get props => [covidInfo];
}

class CovidInfoUpdate extends CovidInfoState {}

class CovidInfoError extends CovidInfoState {}
