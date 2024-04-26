import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';
import 'package:xlo_mobx/repositories/keys/preferences.dart';

class IBGERepository {
  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey(keyUFList)) {
      final j = jsonDecode(preferences.getString(keyUFList) ?? '');
      return j.map<UF>((j) => UF.fromJson(j)).toList();
    } else {
      const endpoint =
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome';
      try {
        final response = await Dio().get<List>(endpoint);
        preferences.setString(keyUFList, jsonEncode(response.data));
        return response.data!.map<UF>((j) => UF.fromJson(j)).toList()
          ..sort(
              (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      } on DioException {
        return Future.error('Falha ao obter lista de Estados.');
      }
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';
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
          'Falha ao obter lista das Cidades do Estado: ${uf.name}.');
    }
  }
}
