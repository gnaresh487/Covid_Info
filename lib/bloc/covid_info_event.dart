import 'package:equatable/equatable.dart';

abstract class CovidInfoEvent extends Equatable {
  const CovidInfoEvent();
}

class FetchCovidInfo extends CovidInfoEvent {
  const FetchCovidInfo();

  @override
  List<Object> get props => [];
}

class UpdateClickedWidget extends CovidInfoEvent {
  const UpdateClickedWidget();

  @override
  List<Object> get props => [];
}