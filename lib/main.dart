import 'package:bloc/bloc.dart';
import 'package:covid_latest_info/bloc/bloc.dart';
import 'package:covid_latest_info/repo/covid_info_repo.dart';
import 'package:covid_latest_info/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CovidInfoBloc>(
        create: (context) => CovidInfoBloc(repository: CovidInfoRepo()),
        child: HomePage(),
      )
    );
  }
}