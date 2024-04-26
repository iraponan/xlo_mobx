import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class Address {
  Address(
      {required this.uf,
      required this.city,
      required this.cep,
      required this.district});

  UF uf;
  City city;
  String cep;
  String district;

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, cep: $cep, district: $district}';
  }
}
