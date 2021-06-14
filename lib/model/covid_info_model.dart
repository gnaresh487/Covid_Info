import 'dart:convert';

CovidInfoModel covidInfoModelFromJson(String str) => CovidInfoModel.fromJson(json.decode(str));

String covidInfoModelToJson(CovidInfoModel data) => json.encode(data.toJson());

class CovidInfoModel {
  CovidInfoModel({
    this.id,
    this.message,
    this.countries,
    this.date,
  });

  String id;
  String message;
  List<Country> countries;
  DateTime date;

  factory CovidInfoModel.fromJson(Map<String, dynamic> json) => CovidInfoModel(
    id: json["ID"],
    message: json["Message"],
    countries: List<Country>.from(json["Countries"].map((x) => Country.fromJson(x))),
    date: DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Message": message,
    "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "Date": date.toIso8601String(),
  };
}

class Country {
  Country({
    this.id,
    this.country,
    this.countryCode,
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
    this.isClicked
  });

  String id;
  String country;
  String countryCode;
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;
  bool isClicked;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["ID"],
    country: json["Country"],
    countryCode: json["CountryCode"],
    totalConfirmed: json["TotalConfirmed"],
    totalDeaths: json["TotalDeaths"],
    totalRecovered: json["TotalRecovered"],
    isClicked: false,
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Country": country,
    "CountryCode": countryCode,
    "TotalConfirmed": totalConfirmed,
    "TotalDeaths": totalDeaths,
    "TotalRecovered": totalRecovered,
  };
}

