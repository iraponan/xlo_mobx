import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/repositories/ibge.dart';

class PostalCodeRepository {
  Future<Address> getAddressFromApi(String? postalCode) async {
    if (postalCode == null || postalCode.isEmpty) {
      return Future.error('CEP Inválido!');
    }
    final cleanPostalCode = postalCode.replaceAll(RegExp('[^0-9]'), '');
    if (cleanPostalCode.length != 8) {
      return Future.error('CEP Inválido!');
    }

    final endpoint = 'https://viacep.com.br/ws/$cleanPostalCode/json/';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data!.containsKey('erro') && response.data!['error']) {
        return Future.error('CEP Inválido!');
      }

      final federativeUnitList = await IBGERepository().getFederativeUnitList();

      return Address(
        postalCode: response.data!['cep'],
        street: response.data!['logradouro'],
        district: response.data!['bairro'],
        city: City(
          name: response.data!['localidade'],
        ),
        federativeUnit: federativeUnitList.firstWhere(
          (federativeUnit) => federativeUnit.initials == response.data!['uf'],
        ),
      );
    } catch (e) {
      return Future.error('CEP Inválido!');
    }
  }
}
