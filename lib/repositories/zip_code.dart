import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/repositories/ibge.dart';

class ZipCodeRepository {
  Future<Address> getAddressFromApi(String? zipCode) async {
    if (zipCode == null || zipCode.isEmpty) {
      return Future.error('CEP Inválido!');
    }
    final cleanZipCode = zipCode.replaceAll(RegExp('[^0-9]'), '');
    if (cleanZipCode.length != 8) {
      return Future.error('CEP Inválido!');
    }

    final endpoint = 'https://viacep.com.br/ws/$cleanZipCode/json/';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data!.containsKey('erro') && response.data!['error']) {
        return Future.error('CEP Inválido!');
      }

      final ufList = await IBGERepository().getUFList();

      return Address(
        cep: response.data!['cep'],
        street: response.data!['logradouro'],
        district: response.data!['bairro'],
        city: City(
          name: response.data!['localidade'],
        ),
        uf: ufList.firstWhere(
          (uf) => uf.initials == response.data!['uf'],
        ),
      );
    } catch (e) {
      return Future.error('CEP Inválido!');
    }
  }
}
