import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/federative_unit.dart';
import 'package:xlo_mobx/repositories/keys/preferences.dart';

class IBGERepository {
  Future<List<FederativeUnit>> getFederativeUnitList() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey(keyFederativeUnitList)) {
      final j = jsonDecode(preferences.getString(keyFederativeUnitList) ?? '');
      return j.map<FederativeUnit>((j) => FederativeUnit.fromJson(j)).toList();
    } else {
      const endpoint =
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome';
      try {
        final response = await Dio().get<List>(endpoint);
        preferences.setString(keyFederativeUnitList, jsonEncode(response.data));
        return response.data!
            .map<FederativeUnit>((j) => FederativeUnit.fromJson(j))
            .toList()
          ..sort(
              (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      } on DioException {
        return Future.error('Falha ao obter lista de Estados.');
      }
    }
  }

  Future<List<City>> getCityListFromApi(FederativeUnit federativeUnit) async {
    final endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${federativeUnit.id}/municipios';
    try {
      final response = await Dio().get<List>(endpoint);
      final cityList = response.data!
          .map<City>((j) => City.fromJson(j))
          .toList()
        ..sort(
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      return cityList;
    } on DioException {
      return Future.error(
          'Falha ao obter lista das Cidades do Estado: ${federativeUnit.name}.');
    }
  }
}
