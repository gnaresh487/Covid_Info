import 'package:covid_latest_info/bloc/bloc.dart';
import 'package:covid_latest_info/model/covid_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CovidInfoModel covidInfoModel = CovidInfoModel();
    // ignore: close_sinks
    final _covidInfoBloc = BlocProvider.of<CovidInfoBloc>(context);
    _covidInfoBloc.add(const FetchCovidInfo());
    return Scaffold(
      appBar: AppBar(title: Text('Covid List Countrywide'),),
      floatingActionButton: null,
      body: BlocBuilder<CovidInfoBloc, CovidInfoState>(
        builder: (context, state) {
          debugPrint('state $state');
          if (state is CovidInfoError) {
            return const Center(child: Text("Failed fetch data"));
          }
          if (state is CovidInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CovidInfoLoaded) {
            covidInfoModel = state?.covidInfo;
            return ListView.builder(
                itemCount: covidInfoModel?.countries?.length ?? 0,
                itemBuilder: (ctx, index) {
                  final Country country = covidInfoModel?.countries[index];
                  return Card(
                      margin: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      elevation: 5,
                      child: listWidget(country, _covidInfoBloc)
                  );
                }
            );
          }
          if (state is CovidInfoUpdate) {
            return ListView.builder(
                itemCount: covidInfoModel?.countries?.length ?? 0,
                itemBuilder: (ctx, index) {
                  final Country country = covidInfoModel?.countries[index];
                  return Card(
                      margin: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                      elevation: 5,
                      child: listWidget(country, _covidInfoBloc)
                  );
                }
            );
          }
          return const Center(child: Text(""));
        },
      ),
    );
  }
}

Widget listWidget(Country country, _covidInfoBloc) {
  debugPrint('update called');
  final bool isClicked = country?.isClicked ?? false;
  return ListTile(
    leading: Text(country?.countryCode, style: const TextStyle(color: Colors.red, fontSize: 14.0),),
    title: Text(country?.country, style: TextStyle(color: isClicked ? Colors.blueAccent : Colors.black,),),
    subtitle: isClicked ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 5,),
        Text('Name of the country : ${country?.country?.toString()}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: isClicked ? Colors.black : Colors.blueAccent),
          textAlign: TextAlign.start,),
        const SizedBox(height: 5,),
        Text('Total confirmed Cases : ${country?.totalConfirmed?.toString()}',),
        const SizedBox(height: 5,),
        Text('No of recoveries : ${country?.totalRecovered?.toString()}', style: const TextStyle(color: Colors.green),),
        const SizedBox(height: 5,),
        Text('No of deaths : ${country?.totalDeaths?.toString()}',style: const TextStyle(color: Colors.red),),
    ],) : const Text(''),
    trailing: IconButton(onPressed: () => {
      country?.isClicked = !country.isClicked,
      _covidInfoBloc.add(UpdateClickedWidget()),
    }, icon: country.isClicked ? const Icon(Icons.keyboard_arrow_up, color: Colors.blueAccent,) : const Icon(Icons.keyboard_arrow_down),),
  );
}